import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/pages/configs/settings_page.dart';
import 'package:games_deals_fschmatz/pages/search_page.dart';

class AppBarSliver extends StatefulWidget {
  const AppBarSliver({Key? key}) : super(key: key);

  @override
  _AppBarSliverState createState() => _AppBarSliverState();
}

class _AppBarSliverState extends State<AppBarSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        title: const Text('Games Deals'),
        pinned: false,
        floating: true,
        snap: true,
        actions: [
         /* IconButton(
              icon: const Icon(
                Icons.search_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SearchPage(),
                    ));
              }),*/
          IconButton(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SettingsPage(),
                    ));
              }),
        ]);
  }
}
