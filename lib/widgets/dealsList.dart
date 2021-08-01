import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/gameDeal.dart';
import 'package:games_deals_fschmatz/pages/configs/settingsPage.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import 'dealTile.dart';

class DealsList extends StatefulWidget {
  int currentStore;

  DealsList({required Key key, required this.currentStore}) : super(key: key);

  @override
  _DealsListState createState() => _DealsListState();
}

class _DealsListState extends State<DealsList> {
  final controllerScrollHideAppbar = ScrollController();
  bool loading = true;
  List<GameDeal> gamesDealsList = [];
  var storeID;
  String urlJson = '';

  @override
  void initState() {
    storeID = widget.currentStore;
    urlJson = 'https://www.cheapshark.com/api/1.0/deals?storeID=$storeID&upperPrice=10';
    loadJsonData();
    super.initState();
  }

  Future<void> loadJsonData() async {
    final response = await http.get(Uri.parse(urlJson));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<GameDeal> listJson =
          List<GameDeal>.from(l.map((model) => GameDeal.fromJson(model)));
      setState(() {
        loading = false;
        gamesDealsList = listJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScrollAppBar(
          controller: controllerScrollHideAppbar,
          title: Text('Games Deals'),
          elevation: 0,
          actions: [
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
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                ),
              )
            : ListView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: controllerScrollHideAppbar,
            children: [
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(
                          height: 0,
                        ),
                    shrinkWrap: true,
                    itemCount: gamesDealsList.length,
                    itemBuilder: (context, index) {
                      return DealTile(gameDeal: gamesDealsList[index]);
                    }),
                const SizedBox(
                  height: 50,
                )
              ]));
  }
}
