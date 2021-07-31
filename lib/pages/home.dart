import 'dart:convert';
import 'package:games_deals_fschmatz/widgets/dealTile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/gameDeal.dart';
import 'configs/settingsPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;
  List<GameDeal> gamesDealsList = [];
  String urlJson = 'https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15';

  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  Future<void> loadJsonData() async {
    final response = await http.get(Uri.parse(urlJson));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<GameDeal> listJson = List<GameDeal>.from(l.map((model)=> GameDeal.fromJson(model)));

      print('x[0] -> ' + listJson[0].toString());
      print('length -> ' + listJson.length.toString());

        setState(() {
          loading = false;
          gamesDealsList = listJson;
        });
      }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Games Deals'),
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
            : ListView(physics: AlwaysScrollableScrollPhysics(), children: [
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(height: 0,),
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
