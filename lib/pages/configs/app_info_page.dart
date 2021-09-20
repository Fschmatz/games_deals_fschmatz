import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/util/changelog.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({Key? key}) : super(key: key);

  _launchGithub() {
    const url = 'https://github.com/Fschmatz/games_deals_fschmatz';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    Color? themeColorText = Theme.of(context).accentTextTheme.headline1!.color;

    return Scaffold(
        appBar: AppBar(
          title: const Text("App Info"),
          elevation: 0,
        ),
        body: ListView(children: <Widget>[
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.deepOrangeAccent,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(Changelog.appName + " " + Changelog.appVersion,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: themeColorText)),
          ),
          const SizedBox(height: 15),
          const Divider(),
          ListTile(
            leading: const SizedBox(
              height: 0.1,
            ),
            title: Text("Dev".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: themeColorText)),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              "Application created using Flutter and the Dart language, used for testing and learning.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const SizedBox(
              height: 0.1,
            ),
            title: Text("Source Code".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: themeColorText)),
          ),
          ListTile(
            onTap: () {
              _launchGithub();
            },
            leading: const Icon(Icons.open_in_new_outlined),
            title: const Text("View on GitHub",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.blue)),
          ),
          const Divider(),
          ListTile(
            leading: const SizedBox(
              height: 0.1,
            ),
            title: Text("Quote".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: themeColorText)),
          ),
          const ListTile(
            leading: Icon(Icons.messenger_outline),
            title: Text(
              "Man’s mind, once stretched by a new idea, never regains its original dimensions.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ]));
  }
}
