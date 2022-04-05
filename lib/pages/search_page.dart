import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:games_deals_fschmatz/classes/searched_game_deal.dart';
import 'package:games_deals_fschmatz/widgets/searchedDealTile.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchedGameDeal> _gamesDealsList = [];
  TextEditingController controllerGameName = TextEditingController();
  bool _loadingSearch = false;
  TextStyle styleButtonsLang =
  const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);

  final String _selectedStore = '25';
  String _urlApi = '';

  Future<void> _searchGame(String name) async {
    setState(() {
      _loadingSearch = true;
    });
    _urlApi =
        'https://www.cheapshark.com/api/1.0/games?title=$name&limit=50&exact=0&store=$_selectedStore';

    final response = await http.get(Uri.parse(_urlApi));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<SearchedGameDeal> listJson = List<SearchedGameDeal>.from(
          l.map((model) => SearchedGameDeal.fromJson(model)));
      setState(() {
        _loadingSearch = false;
        _gamesDealsList = listJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color? textAccent = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Search Game'),
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 3),
            child: _loadingSearch
                ? LinearProgressIndicator(
                    minHeight: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary.withOpacity(0.8)),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  )
                : const SizedBox(
                    height: 3,
                  )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 15),
            child: TextField(
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                controller: controllerGameName,
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined,color: textAccent ),
                  filled: true,
                ),
                onEditingComplete: () {
                  if (controllerGameName.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    _searchGame(controllerGameName.text);
                  }
                }),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _loadingSearch
                      ? const SizedBox.shrink()
                      : ListView.separated(
                          //physics: AlwaysScrollableScrollPhysics(),
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const Divider(
                                height: 0,
                              ),
                          shrinkWrap: true,
                          itemCount: _gamesDealsList.length,
                          itemBuilder: (context, index) {
                            return SearchedDealTile(
                                searchedGameDeal: _gamesDealsList[index]);
                          }),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
