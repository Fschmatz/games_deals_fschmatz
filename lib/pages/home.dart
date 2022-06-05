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
      bottomNavigationBar: NavigationBar(
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
            selectedIcon: Icon(Icons.local_offer_rounded),
            label: 'Giveaway',
          ),
          NavigationDestination(
            icon: Icon(StoreIcons.epic),
            selectedIcon: Icon(StoreIcons.epic),
            label: 'Epic',
          ),
          NavigationDestination(
            icon: Icon(StoreIcons.origin),
            selectedIcon: Icon(StoreIcons.origin),
            label: 'Origin',
          ),
          NavigationDestination(
            icon: Icon(StoreIcons.steam),
            selectedIcon: Icon(StoreIcons.steam),
            label: 'Steam',
          ),
          NavigationDestination(
            icon: Icon(StoreIcons.gogv3,size: 23,),
            selectedIcon: Icon(StoreIcons.gogv3,),
            label: 'GOG',
          ),
        ],
      ),
    );
  }
}
