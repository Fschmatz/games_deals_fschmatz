import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/util/app_details.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfoPage extends StatelessWidget {
  AppInfoPage({Key? key}) : super(key: key);

  String apologiesText = "Prices from CheapShark API\nGiveaways from GamerPower API";

    /*  'All values are in dollars, '
      'but the CheapShark API is free and can be used at least to track promotions.\n'
      'For Brazil, the percentage of the discount will always be the same, but as there are changes in prices that are practiced around the world, '
      'the final value cannot be directly converted using the dollar value.\n'
      'The giveaway page uses the GamerPower API, the store and search pages '
      'are using the CheapShark API.';*/

  _launchGithub() {
    String url = AppDetails.repositoryLink;
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    Color? themeColorText = Theme.of(context).colorScheme.primary;

    return Scaffold(
        appBar: AppBar(
          title: const Text("App Info"),
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
            child: Text(AppDetails.appName + " " + AppDetails.appVersion,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: themeColorText)),
          ),
          const SizedBox(height: 15),
          ListTile(
            title: Text("Dev",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: themeColorText)),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              "Application created using Flutter and the Dart language.",
            ),
          ),
          ListTile(
            title: Text("Source Code",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
          ListTile(
            title: Text("Quote",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: themeColorText)),
          ),
          const ListTile(
            leading: Icon(Icons.messenger_outline),
            title: Text(
              "Man’s mind, once stretched by a new idea, never regains its original dimensions.",
            ),
          ),
          ListTile(
            title: Text("API Info",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: themeColorText)),
          ),
          ListTile(
            leading: const Icon(
              Icons.integration_instructions_outlined,
            ),
            title: Text(
              apologiesText,
            ),
          ),
          const SizedBox(height: 30),
        ]));
  }
}
