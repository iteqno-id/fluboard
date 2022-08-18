import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:fluboard/screen/account_screen.dart';
import 'package:fluboard/screen/home_screen.dart';
import 'package:fluboard/utils/extension.dart';
import 'package:fluboard/widgets/number_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/people/v1.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final box = Hive.box(AppConfig.dbSettings);
  AppRepository repository = getIt<AppRepository>();

  @override
  void dispose() {
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
          AppConfig.photoRefresh,
          suffixText: "seconds",
        ),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.building_2_fill),
        title: const Text('City location'),
        trailing: Text(repository.getConfig(AppConfig.cityBox, "Jakarta")),
        onTap: () => _showStringSetting(AppConfig.cityBox, "City Location",
            defaultValue: "Jakarta, Indonesia"),
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
          AppConfig.currentWeatherRefresh,
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
          AppConfig.forecastRefresh,
          suffixText: "hour(s)",
        ),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.thermometer),
        title: const Text('Units'),
        trailing: Text(
            toBeginningOfSentenceCase(repository.getConfig<String>(AppConfig.unitsBox, "metric"))!),
        onTap: () => _showUnits(),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.clock),
        title: const Text('Hour format'),
        trailing: Text("${repository.getConfig(AppConfig.hourFormatBox, 12)} hours"),
        onTap: () => _showHourFormat(),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.globe),
        title: const Text('Localization'),
        trailing: const Text("en_US"),
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
        trailing: const Icon(Icons.chevron_right),
        onTap: () => _showStringSetting(AppConfig.openWeatherApiBox, "Open Weather API"),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.person_alt_circle),
        title: const Text('Google Account'),
        trailing: const Icon(Icons.chevron_right),
        subtitle: FutureBuilder<Person>(
          future: repository.getUserInfo(),
          builder: (BuildContext context, AsyncSnapshot<Person> snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data?.emailAddresses?.first.value}");
            } else {
              return Container();
            }
          },
        ),
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountScreen())),
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
                  const SizedBox(height: 8),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showNumberSetting(String key, String title, int defaultValue, {String suffixText = ""}) {
    TextEditingController controller = TextEditingController();
    controller.text = repository.getConfig<int>(key, defaultValue).toString();
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

  _showStringSetting(String key, String title, {String defaultValue = ""}) {
    TextEditingController controller = TextEditingController();
    controller.text = repository.getConfig<String>(key, defaultValue);
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Container(
          margin: const EdgeInsets.all(16),
          child: CupertinoTextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              repository.setConfig(key, controller.text);
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
    ).then((value) => controller.dispose());
  }

  _showHourFormat() {
    final currentFormat = repository.getConfig(AppConfig.hourFormatBox, 12);
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text("Hour Format"),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: currentFormat == 12,
            onPressed: () {
              repository.setConfig(AppConfig.hourFormatBox, 12);
              Navigator.pop(context);
            },
            child: const Text('12 hours (AM/PM)'),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: currentFormat == 24,
            onPressed: () {
              repository.setConfig(AppConfig.hourFormatBox, 24);
              Navigator.pop(context);
            },
            child: const Text('24 hours'),
          ),
        ],
        cancelButton: CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  _showUnits() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text("Units"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              repository.setConfig(AppConfig.unitsBox, "standard");
              Navigator.pop(context);
            },
            child: const Text('Standard (Kelvin, Meter)'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              repository.setConfig(AppConfig.unitsBox, "metric");
              Navigator.pop(context);
            },
            child: const Text('Metric (Celsius, Meter)'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              repository.setConfig(AppConfig.unitsBox, "imperial");
              Navigator.pop(context);
            },
            child: const Text('Imperial (Fahrenheit, Mile)'),
          ),
        ],
        cancelButton: CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
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
