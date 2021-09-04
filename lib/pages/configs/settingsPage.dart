import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/util/changelog.dart';
import 'package:games_deals_fschmatz/util/theme.dart';
import 'package:provider/provider.dart';
import 'appInfoPage.dart';
import 'changelogPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();

  SettingsPage({Key? key}) : super(key: key);
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  String apologiesText = 'Yes, i know that all values are in dollars, '
      'but the CheapShark API is free and can be used at least to track promotions.\n'
      'In Brazil, the percentage of the discount will always be the same, but as there are changes in prices that are practiced around the world, '
      'the final value cannot be directly converted using the dollar value.';

  String apiExplain = 'Giveaways page use the GamerPower API and the store pages '
      'are using the CheapShark API.';


  @override
  Widget build(BuildContext context) {
    Color? themeColorText = Theme.of(context).accentTextTheme.headline1!.color;

    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 1,
              margin: const EdgeInsets.fromLTRB(16, 20, 16, 10),
              color: Theme.of(context).accentColor.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ListTile(
                title: Text(
                  Changelog.appName + " " + Changelog.appVersion,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.5),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: SizedBox(
                height: 0.1,
              ),
              title: Text("About".toUpperCase(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: themeColorText)),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
              ),
              title: Text(
                "App Info",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => AppInfoPage(),
                      fullscreenDialog: true,
                    ));
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(
                Icons.article_outlined,
              ),
              title: Text(
                "Changelog",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ChangelogPage(),
                      fullscreenDialog: true,
                    ));
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              leading: Icon(
                Icons.report_problem_outlined,
              ),
              title: Text(
                apologiesText,
                style:
                TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              leading: SizedBox(
                height: 0.1,
              ),
              title: Text(
                apiExplain,
                style:
                TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
              ),
            ),
            const Divider(),
            ListTile(
              leading: SizedBox(
                height: 0.1,
              ),
              title: Text("General".toUpperCase(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: themeColorText)),
            ),
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => SwitchListTile(
                  title: Text(
                    "Dark Theme",
                    style: TextStyle(fontSize: 16),
                  ),
                  secondary: Icon(Icons.brightness_6_outlined),
                  activeColor: Colors.blue,
                  value: notifier.darkTheme,
                  onChanged: (value) {
                    notifier.toggleTheme();
                  }),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
