import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/game_deal.dart';
import '../widgets/deal_tile.dart';
import 'configs/settings_page.dart';

class DealsListPage extends StatefulWidget {
  int currentStore;

  DealsListPage({required Key key, required this.currentStore})
      : super(key: key);

  @override
  _DealsListPageState createState() => _DealsListPageState();
}

class _DealsListPageState extends State<DealsListPage> {
  bool loading = true;
  List<GameDeal> gamesDealsList = [];
  var storeID;
  String urlJson = '';

  @override
  void initState() {
    storeID = widget.currentStore;
    urlJson =
        'https://www.cheapshark.com/api/1.0/deals?storeID=$storeID&upperPrice=10';
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
      appBar: AppBar(
        title: const Text('Games Deals'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SettingsPage(),
                    ));
              }),
        ],
      ),
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
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
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
                    ]),
        ),
      ),
    );
  }
}
