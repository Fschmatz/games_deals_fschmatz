import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/pages/giveawayPage.dart';
import 'package:games_deals_fschmatz/pages/searchPage.dart';
import 'package:games_deals_fschmatz/pages/dealsListPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:games_deals_fschmatz/util/storeIcons.dart';
import 'configs/settingsPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // DOCS -> https://apidocs.cheapshark.com/
  // Steam = 1 , Epic = 25, GOG = 7, Origin = 8

  int _currentIndex = 0;
  List<Widget> _storesList = [
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
      currentStore: 7,
    ),
    DealsListPage(
      key: UniqueKey(),
      currentStore: 1,
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
        title: Text('Games Deals'),
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
                      builder: (BuildContext context) => SettingsPage(),
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
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
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
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor:
                  Theme.of(context).accentColor.withOpacity(0.3),
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
              tabs: [
                GButton(
                  icon: Icons.local_offer_rounded,
                  text: 'Giveaways',
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
                  icon: StoreIcons.gogv3,
                  iconSize: 23,
                  text: 'GOG',
                  textStyle: styleFontNavBar,
                ),
                GButton(
                  icon: StoreIcons.steam,
                  text: 'Steam',
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
