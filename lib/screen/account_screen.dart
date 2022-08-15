import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/model/google/local_access_token.dart';
import 'package:fluboard/data/provider/access_token_provider.dart';
import 'package:fluboard/data/provider/people_provider.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String url = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Setting'),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Consumer<AccessTokenProvider>(
            builder: (context, provider, _) {
              if (provider.state == ResultState.loading) {
                return const CupertinoActivityIndicator();
              } else if (provider.state == ResultState.hasData) {
                return _profile(context);
              } else {
                return login();
              }
            },
          ),
        ),
      )),
    );
  }

  Widget _profile(BuildContext context) {
    return Consumer<PeopleProvider>(
      builder: (BuildContext context, provider, _) {
        if (provider.state == ResultState.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (provider.state == ResultState.hasData) {
          var person = provider.person;
          return Column(
            children: [
              CircleAvatar(
                radius: 52,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(52),
                  child: Image.network("${person.photos?.first.url?.replaceAll('=s100', '')}"),
                ),
              ),
              const SizedBox(height: 8),
              Text("${person.names?.first.displayName}",
                  style: Theme.of(context).textTheme.titleLarge),
              Text("${person.emailAddresses?.first.value}"),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => logout(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          );
        } else {
          return login();
        }
      },
    );
  }

  Widget login() {
    return Column(
      children: [
        const Text('Please login to connect Google Calendar, Photos & Tasks'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            var repo = getIt<AppRepository>();
            repo.login((url) => launchUrl(Uri.parse(url))).then((value) {
              var accessToken = value.credentials.accessToken;
              repo.setConfig(AppConfig.refreshToken, value.credentials.refreshToken);
              repo.setConfig(
                  AppConfig.accessToken,
                  LocalAccessToken(
                    type: accessToken.type,
                    data: accessToken.data,
                    expiry: accessToken.expiry,
                  ));
              Provider.of<AccessTokenProvider>(context, listen: false).getAccessToken();
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.login),
              SizedBox(width: 8),
              Text('Login'),
            ],
          ),
        ),
      ],
    );
  }

  logout(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure want to logout?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              var repo = getIt<AppRepository>();
              repo.setConfig(AppConfig.refreshToken, null);
              repo.setConfig(AppConfig.accessToken, null);
              Navigator.pop(context);
              Provider.of<AccessTokenProvider>(context, listen: false).getAccessToken();
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
}
