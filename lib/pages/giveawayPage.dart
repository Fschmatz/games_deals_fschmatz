import 'dart:convert';
import 'package:games_deals_fschmatz/classes/giveaway.dart';
import 'package:games_deals_fschmatz/util/storeIcons.dart';
import 'package:games_deals_fschmatz/widgets/giveawayTile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GiveawayPage extends StatefulWidget {
  GiveawayPage({required Key key}) : super(key: key);

  @override
  _GiveawayPageState createState() => _GiveawayPageState();
}

class _GiveawayPageState extends State<GiveawayPage> {
  //API
  //https://www.gamerpower.com/api-read

  bool loading = true;
  List<Giveaway> giveawayList = [];
  String urlJson = '';

  @override
  void initState() {
    urlJson =
        'https://www.gamerpower.com/api/filter?platform=epic-games-store.steam.origin.gog';
    loadJsonData();
    super.initState();
  }

  Future<void> loadJsonData() async {
    final response = await http.get(Uri.parse(urlJson));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Giveaway> listJson =
          List<Giveaway>.from(l.map((model) => Giveaway.fromJson(model)));
      setState(() {
        loading = false;
        giveawayList = listJson;
      });
    }
  }

  Widget separatedList(
      String shopName, IconData iconLoja, BuildContext context) {
    TextStyle titleStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).accentTextTheme.headline1!.color);

    return Column(
      children: [
        ListTile(
          leading: Icon(iconLoja,
              color: Theme.of(context).accentTextTheme.headline1!.color),
          title: Text(
            shopName.toUpperCase(),
            style: titleStyle,
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: giveawayList.length,
            itemBuilder: (context, index) {
              return Visibility(
                  visible: giveawayList[index].platforms.contains(shopName),
                  child: GiveawayTile(giveaway: giveawayList[index]));
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                ),
              )
            : ListView(physics: AlwaysScrollableScrollPhysics(), children: [
                separatedList('Epic', StoreIcons.epic, context),
                const Divider(),
                separatedList('Origin', StoreIcons.origin, context),
                const Divider(),
                separatedList('GOG', StoreIcons.gogv3, context),
          const Divider(),
                separatedList('Steam', StoreIcons.steam, context),
                const SizedBox(
                  height: 50,
                )
              ]));
  }
}
