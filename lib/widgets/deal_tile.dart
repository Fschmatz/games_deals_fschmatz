import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/game_deal.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class DealTile extends StatefulWidget {
  GameDeal gameDeal;

  DealTile({Key? key, required this.gameDeal}) : super(key: key);

  @override
  _DealTileState createState() => _DealTileState();
}

class _DealTileState extends State<DealTile> {
  String urlOpenLinks = 'https://www.cheapshark.com/redirect?dealID=';

  _launchLink() {
    var url = urlOpenLinks + widget.gameDeal.dealID;
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle detailsStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.primary);

    String percentDiscountFormatted = double.parse(widget.gameDeal.savings)
            .roundToDouble()
            .toStringAsFixed(0)
            .toString() +
        '%';

    return ListTile(
      onTap: () {
        _launchLink();
      },
      onLongPress: () {
        Share.share(urlOpenLinks + widget.gameDeal.dealID);
      },
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      title: Row(
        children: [
          Visibility(
            visible: percentDiscountFormatted != '0%',
            child: CircleAvatar(
                radius: 22,
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                child: Text(
                  percentDiscountFormatted,
                  textAlign: TextAlign.center,
                  style: detailsStyle,
                )),
          ),
          Visibility(
              visible: percentDiscountFormatted != '0%',
              child: const SizedBox(
                width: 15,
              )),
          Flexible(child: Text(widget.gameDeal.title)),
        ],
      ),
      trailing: widget.gameDeal.salePrice.toString() == '0.00'
          ? Text(
              'FREE',
              textAlign: TextAlign.center,
              style: detailsStyle,
            )
          : Text(
              '\$ ' + widget.gameDeal.salePrice.toString(),
              textAlign: TextAlign.center,
              style: detailsStyle,
            ),
    );
  }
}
