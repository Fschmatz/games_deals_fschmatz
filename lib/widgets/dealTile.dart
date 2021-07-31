import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/gameDeal.dart';

class DealTile extends StatefulWidget {
  GameDeal gameDeal;

  DealTile({Key? key, required this.gameDeal}) : super(key: key);

  @override
  _DealTileState createState() => _DealTileState();
}

class _DealTileState extends State<DealTile> {


  @override
  Widget build(BuildContext context) {

    TextStyle detailsStyle =
    TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600, color: Theme.of(context).accentColor);

    String percentDiscountFormatted = double.parse(widget.gameDeal.savings)
        .roundToDouble()
        .toStringAsFixed(0)
        .toString()+'%';

    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      leading: Visibility(
        visible: percentDiscountFormatted != '0%',
        child: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.4),
            child: Text(percentDiscountFormatted,textAlign: TextAlign.center,
              style: detailsStyle,)),
      ),
      title: Text(widget.gameDeal.title),
      trailing: Text(
        'Value: ' + widget.gameDeal.salePrice.toString(),
        textAlign: TextAlign.center,
        style: detailsStyle,
      ),
    );
  }
}
