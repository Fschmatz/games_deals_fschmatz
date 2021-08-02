import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/widgets/dealsList.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // DOCS -> https://apidocs.cheapshark.com/
  // Steam = 1 , Epic = 25, GOG = 6, Origin = 7

  //start with Epic
  int _currentIndex = 0;
  List<Widget> _storesList = [
    DealsList(
      key: UniqueKey(),
      currentStore: 25,
    ),
    DealsList(
      key: UniqueKey(),
      currentStore: 1,
    ),
    DealsList(
      key: UniqueKey(),
      currentStore: 6,
    ),
    DealsList(
      key: UniqueKey(),
      currentStore: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle styleFontNavBar = TextStyle(
        fontSize: 14.5,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.8));

    return Scaffold(
      body: SafeArea(child: _storesList[_currentIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
            child: GNav(
              rippleColor: Theme.of(context).accentColor.withOpacity(0.4),
              hoverColor: Theme.of(context).accentColor.withOpacity(0.4),
              gap: 1,
              activeColor: Theme.of(context).accentColor,
              tabBorderRadius: 18,
              iconSize: 0,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor:
              Theme.of(context).accentTextTheme.headline2!.color!,
              backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
              tabs: [
                GButton(
                  icon: Icons.circle,
                  leading: Text('   Epic',style: styleFontNavBar),
                ),
                GButton(
                  icon: Icons.circle,
                  leading: Text('   Steam',style: styleFontNavBar),
                ),
                GButton(
                  icon: Icons.circle,
                  leading: Text('   GOG', style: styleFontNavBar),
                ),
                GButton(
                  icon: Icons.circle,
                  leading: Text('   Origin',style: styleFontNavBar),
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

