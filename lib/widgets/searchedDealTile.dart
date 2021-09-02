import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dynamic_value/dynamic_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/searchedGameDeal.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchedDealTile extends StatefulWidget {
  SearchedGameDeal searchedGameDeal;

  SearchedDealTile({Key? key, required this.searchedGameDeal}) : super(key: key);

  @override
  _SearchedDealTileState createState() => _SearchedDealTileState();
}

class _SearchedDealTileState extends State<SearchedDealTile> {
  String urlOpenLinks = 'https://www.cheapshark.com/redirect?dealID=';
  String _dealID = '';

  @override
  void initState() {
    _dealID = widget.searchedGameDeal.dealID;
   // getStoreName();
    super.initState();
  }

  /*Future<void> getStoreName() async {
    String urlApi = 'https://www.cheapshark.com/api/1.0/deals?id=$_dealID';

    final response = await http.get(Uri.parse(urlApi));
    final value = DynamicValue(json.decode(response.body));

    print(json.decode(response.body));
    if (response.statusCode == 200) {
      print('ID LOJA -> '+value['gameInfo'].toMap().toString());
      //return value['storeID'].toString();
    }
  }*/

  // print(value['gameInfo'][0]['storeID'].toString());

  _launchlink() {
    var url = urlOpenLinks + widget.searchedGameDeal.dealID;
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle detailsStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).accentTextTheme.headline1!.color);

    return ListTile(
      onTap: () {
        _launchlink();
      },
      contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      title: Text(widget.searchedGameDeal.title),
      trailing: widget.searchedGameDeal.salePrice.toString() == '0.00'
          ? Text(
        'FREE',
        textAlign: TextAlign.center,
        style: detailsStyle,
      )
          : Text(
        '\$ ' + widget.searchedGameDeal.salePrice.toString(),
        textAlign: TextAlign.center,
        style: detailsStyle,
      ),
    );
  }
}
