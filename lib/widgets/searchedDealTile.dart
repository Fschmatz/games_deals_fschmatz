import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/searched_game_deal.dart';
import 'package:share/share.dart';
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
    super.initState();
  }

  _launchLink() {
    var url = urlOpenLinks + widget.searchedGameDeal.dealID;
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle detailsStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary);

    return ListTile(
      onTap: () {
        _launchLink();
      },
      onLongPress: () {
        Share.share(urlOpenLinks + widget.searchedGameDeal.dealID);
      },
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
