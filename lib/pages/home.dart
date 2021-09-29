import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/pages/giveaway_page.dart';
import 'package:games_deals_fschmatz/pages/search_page.dart';
import 'package:games_deals_fschmatz/pages/deals_list_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:games_deals_fschmatz/util/store_icons.dart';
import 'configs/settings_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //APIs
  // DOCS -> https://apidocs.cheapshark.com/
  // Steam = 1 , Epic = 25, GOG = 7, Origin = 8
  //https://www.gamerpower.com/api-read

  int _currentIndex = 0;
  final List<Widget> _storesList = [
    GiveawayPage(
      key: UniqueKey(),
    ),
    DealsListPage(
      key: UniqueKey(),
      currentStore: 25,
    ),
    DealsListPage(
      key: UniqueKey(),
      currentStore: 8,
    ),
    DealsListPage(
      key: UniqueKey(),
      currentStore: 1,
    ),
    DealsListPage(
      key: UniqueKey(),
      currentStore: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle styleFontNavBar = TextStyle(
        fontSize: 14.5,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).accentColor);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Games Deals'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .headline6!
                      .color!
                      .withOpacity(0.7),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SearchPage(),
                        fullscreenDialog: true,
                      ));
                }),
          ),
          IconButton(
              icon: Icon(
                Icons.settings_outlined,
                color: Theme.of(context)
                    .textTheme
                    .headline6!
                    .color!
                    .withOpacity(0.7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SettingsPage(),
                      fullscreenDialog: true,
                    ));
              }),
        ],
      ),
      body: SafeArea(child: _storesList[_currentIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: GNav(
              rippleColor: Theme.of(context).accentColor.withOpacity(0.4),
              hoverColor: Theme.of(context).accentColor.withOpacity(0.4),
              color: Theme.of(context)
                  .textTheme
                  .headline6!
                  .color!
                  .withOpacity(0.7),
              gap: 10,
              activeColor: Theme.of(context).accentColor,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              duration: const Duration(milliseconds: 500),
              tabBackgroundColor:
                  Theme.of(context).accentColor.withOpacity(0.3),
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
              tabs: [
                GButton(
                  icon: Icons.local_offer_rounded,
                  text: 'Giveaway',
                  textStyle: styleFontNavBar,
                ),
                GButton(
                  icon: StoreIcons.epic,
                  text: 'Epic',
                  textStyle: styleFontNavBar,
                ),
                GButton(
                  icon: StoreIcons.origin,
                  text: 'Origin',
                  textStyle: styleFontNavBar,
                ),
                GButton(
                  icon: StoreIcons.steam,
                  text: 'Steam',
                  textStyle: styleFontNavBar,
                ),
                GButton(
                  icon: StoreIcons.gogv3,
                  iconSize: 23,
                  text: 'GOG',
                  textStyle: styleFontNavBar,
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
