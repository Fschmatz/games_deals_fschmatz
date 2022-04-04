import 'dart:convert';
import 'package:games_deals_fschmatz/classes/giveaway.dart';
import 'package:games_deals_fschmatz/util/store_icons.dart';
import 'package:games_deals_fschmatz/widgets/app_bar_sliver.dart';
import 'package:games_deals_fschmatz/widgets/giveaway_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GiveawayPage extends StatefulWidget {
  const GiveawayPage({required Key key}) : super(key: key);

  @override
  _GiveawayPageState createState() => _GiveawayPageState();
}

class _GiveawayPageState extends State<GiveawayPage> {
  bool loading = true;
  List<Giveaway> giveawayList = [];
  String urlJson =
      'https://www.gamerpower.com/api/filter?platform=epic-games-store.steam.origin.gog';

  @override
  void initState() {
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
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.primary);

    return Column(
      children: [
        ListTile(
          leading: Icon(iconLoja,
              color: Theme.of(context).colorScheme.primary),
          title: Text(
            shopName,
            style: titleStyle,
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[const AppBarSliver()];
      },
      body: RefreshIndicator(
        onRefresh: loadJsonData,
        color: Theme.of(context).colorScheme.primary,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                      separatedList('Epic', StoreIcons.epic, context),
                      const Divider(),
                      separatedList('Origin', StoreIcons.origin, context),
                      const Divider(),
                      separatedList('Steam', StoreIcons.steam, context),
                      const Divider(),
                      separatedList('GOG', StoreIcons.gogv3, context),
                      const SizedBox(
                        height: 50,
                      )
                    ]),
        ),
      ),
    ));
  }
}

//GOG always gives it, remove?
//!giveawayList[index].title.contains('The Witcher: Enhanced Edition'
