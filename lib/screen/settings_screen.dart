import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/screen/home_screen.dart';
import 'package:fluboard/utils/extension.dart';
import 'package:fluboard/widgets/number_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final box = Hive.box(AppConfig.dbSettings);
  TextEditingController photoRefreshController = TextEditingController();
  TextEditingController weatherRefreshController = TextEditingController();
  TextEditingController forecastRefreshController = TextEditingController();

  @override
  void dispose() {
    photoRefreshController.dispose();
    weatherRefreshController.dispose();
    forecastRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ListTile> generalSettings = [
      ListTile(
        leading: const Icon(CupertinoIcons.photo),
        title: const Text('Photo refresh'),
        trailing: Text((box.get(AppConfig.photoDoc, defaultValue: AppConfig.photoRefresh) as int)
            .pluralize("second")),
        onTap: () => _showNumberSetting(
          AppConfig.photoDoc,
          "Photo Refresh",
          photoRefreshController,
          suffixText: "seconds",
        ),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.cloud_sun_rain),
        title: const Text('Weather refresh'),
        trailing: Text((box.get(AppConfig.currentWeatherDoc,
                defaultValue: AppConfig.currentWeatherRefresh) as int)
            .pluralize('minute')),
        onTap: () => _showNumberSetting(
          AppConfig.currentWeatherDoc,
          "Weather Refresh",
          weatherRefreshController,
          suffixText: "minutes",
        ),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.cloud_sun_rain_fill),
        title: const Text('Forecast refresh'),
        trailing: Text(
          (box.get(AppConfig.forecastDoc, defaultValue: AppConfig.forecastRefresh) as int)
              .pluralize("hour"),
        ),
        onTap: () => _showNumberSetting(
          AppConfig.forecastDoc,
          "Forecast Refresh",
          forecastRefreshController,
          suffixText: "hour(s)",
        ),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.clock),
        title: const Text('Hour format'),
        trailing: const Text("12 hours"),
        onTap: () => _showUnderConstruction(),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.globe),
        title: const Text('Localization'),
        trailing: const Text("id_ID"),
        onTap: () => _showUnderConstruction(),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.globe),
        title: const Text('Language'),
        trailing: const Text("English"),
        onTap: () => _showUnderConstruction(),
      ),
    ];

    List<ListTile> accountSettings = [
      ListTile(
        leading: const Icon(CupertinoIcons.cloud_sun),
        title: const Text('Open Weather'),
        trailing: Icon(Icons.chevron_right),
        onTap: () => _showUnderConstruction(),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.photo),
        title: const Text('Google Photo'),
        trailing: Text('fluboard@gmail.com'),
        onTap: () => _showUnderConstruction(),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.calendar),
        title: const Text('Google Calendar'),
        trailing: Text('fluboard@gmail.com'),
        onTap: () => _showUnderConstruction(),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.check_mark_circled),
        title: const Text('Google Task'),
        trailing: Text('fluboard@gmail.com'),
        onTap: () => _showUnderConstruction(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Text("General settings", style: Theme.of(context).textTheme.titleLarge),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return generalSettings[i];
                        },
                        separatorBuilder: (context, i) => const Divider(),
                        itemCount: generalSettings.length),
                  ),
                  const SizedBox(height: 8),
                  Text("Account settings", style: Theme.of(context).textTheme.titleLarge),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return accountSettings[i];
                        },
                        separatorBuilder: (context, i) => const Divider(),
                        itemCount: accountSettings.length),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showNumberSetting(String key, String title, TextEditingController controller,
      {String suffixText = ""}) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Container(
          margin: const EdgeInsets.all(16),
          child: NumberField(
            controller: controller,
            suffixText: suffixText,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              box.put(key, int.parse(controller.value.text));
              Navigator.pop(context, () => setState(() {}));
            },
            child: const Text('Save'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  _showUnderConstruction() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Under development'),
        content: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: const [
              Icon(CupertinoIcons.settings, size: 56),
              SizedBox(height: 8),
              Text('This settings is under development'),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
