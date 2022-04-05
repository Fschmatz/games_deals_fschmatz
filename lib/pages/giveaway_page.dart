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

  List<Giveaway> epicList = [];
  List<Giveaway> originList = [];
  List<Giveaway> steamList = [];
  List<Giveaway> gogList = [];

  @override
  void initState() {
    giveawayFunctions();
    super.initState();
  }

  void giveawayFunctions() async {
    await loadJsonData();
    await filterLists();
  }

  Future<void> filterLists() async {
    epicList = giveawayList.where((o) => o.platforms.contains('Epic')).toList();

    originList =
        giveawayList.where((o) => o.platforms.contains('Origin')).toList();

    steamList =
        giveawayList.where((o) => o.platforms.contains('Steam')).toList();

    gogList = giveawayList.where((o) => o.platforms.contains('GOG')).toList();

    setState(() {
      loading = false;
      epicList;
      originList;
      steamList;
      gogList;
    });
  }

  Future<void> loadJsonData() async {
    final response = await http.get(Uri.parse(urlJson));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Giveaway> listJson =
          List<Giveaway>.from(l.map((model) => Giveaway.fromJson(model)));
      giveawayList = listJson;
    }
  }

  Widget separatedList(List<Giveaway> list, String storeName, IconData storeIcon,
      BuildContext context) {
    TextStyle titleStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary);

    return Column(
      children: [
        ListTile(
          leading: Icon(storeIcon, color: Theme.of(context).colorScheme.primary),
          title: Text(
            storeName,
            style: titleStyle,
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GiveawayTile(giveaway: giveawayList[index]);
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
                      Visibility(
                        visible: epicList.isNotEmpty,
                        child: separatedList(
                            epicList, 'Epic', StoreIcons.epic, context),
                      ),
                      Visibility(
                        visible: originList.isNotEmpty,
                        child: separatedList(
                            originList, 'Origin', StoreIcons.origin, context),
                      ),
                      Visibility(
                          visible: steamList.isNotEmpty,
                          child: separatedList(
                              steamList, 'Steam', StoreIcons.steam, context)),
                      Visibility(
                          visible: gogList.isNotEmpty,
                          child: separatedList(
                              gogList, 'GOG', StoreIcons.gogv3, context)),
                      const SizedBox(
                        height: 50,
                      )
                    ]),
        ),
      ),
    ));
  }
}
