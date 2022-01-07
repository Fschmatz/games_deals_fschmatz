import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/pages/giveaway_page.dart';
import 'package:games_deals_fschmatz/pages/search_page.dart';
import 'package:games_deals_fschmatz/pages/deals_list_page.dart';
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

    return Scaffold(
      body: SafeArea(child: _storesList[_currentIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.local_offer_rounded),
                selectedIcon: Icon(Icons.local_offer_rounded,color: Colors.black87,),
                label: 'Giveaway',
              ),
              NavigationDestination(
                icon: Icon(StoreIcons.epic),
                selectedIcon: Icon(StoreIcons.epic,color: Colors.black87,),
                label: 'Epic',
              ),
              NavigationDestination(
                icon: Icon(StoreIcons.origin),
                selectedIcon: Icon(StoreIcons.origin,color: Colors.black87,),
                label: 'Origin',
              ),
              NavigationDestination(
                icon: Icon(StoreIcons.steam),
                selectedIcon: Icon(StoreIcons.steam,color: Colors.black87,),
                label: 'Steam',
              ),
              NavigationDestination(
                icon: Icon(StoreIcons.gogv3,size: 23,),
                selectedIcon: Icon(StoreIcons.gogv3,color: Colors.black87,),
                label: 'GOG',
              ),
            ],
          ),
        ),
      ),

     /* Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child:
        SafeArea(
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
      ),*/
    );
  }
}
