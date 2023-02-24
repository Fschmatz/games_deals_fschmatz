import 'dart:convert';
import 'package:games_deals_fschmatz/classes/giveaway.dart';
import 'package:games_deals_fschmatz/util/store_icons.dart';
import 'package:games_deals_fschmatz/widgets/app_bar_sliver.dart';
import 'package:games_deals_fschmatz/widgets/giveaway_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

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
  DateTime today = DateTime.now();

  @override
  void initState() {
    giveawayFunctions();
    super.initState();
  }

  Future<void> giveawayFunctions() async {
    await loadJsonData();
    await filterLists();
  }

  Future<void> filterLists() async {
    epicList = giveawayList
        .where((g) =>
            g.platforms.contains('Epic') &&
                checkPublishedDateLessThanSixMonths(g))
        .toList();

    originList = giveawayList
        .where((g) =>
            g.platforms.contains('Origin') &&
                checkPublishedDateLessThanSixMonths(g))
        .toList();

    steamList = giveawayList
        .where((g) =>
            g.platforms.contains('Steam') &&
                checkPublishedDateLessThanSixMonths(g))
        .toList();

    gogList = giveawayList
        .where((g) =>
            g.platforms.contains('GOG') &&
                checkPublishedDateLessThanSixMonths(g))
        .toList();

    setState(() {
      loading = false;
    });
  }

  bool checkPublishedDateLessThanSixMonths(Giveaway giveaway) {
    return (Jiffy(giveaway.publishedDate).dateTime
        .isAfter(Jiffy(today).subtract(months: 6).dateTime));
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

  Widget separatedList(List<Giveaway> filteredList, String storeName,
      IconData storeIcon, BuildContext context) {
    TextStyle titleStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.primary);

    return Column(
      children: [
        ListTile(
          leading:
              Icon(storeIcon, color: Theme.of(context).colorScheme.primary),
          title: Text(
            storeName,
            style: titleStyle,
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return GiveawayTile(giveaway: filteredList[index]);
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
        onRefresh: giveawayFunctions,
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
