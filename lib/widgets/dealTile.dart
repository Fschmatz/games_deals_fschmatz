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
    double percentDiscount = double.parse(widget.gameDeal.savings).roundToDouble();


    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      title: Text(widget.gameDeal.title),
      trailing: Text(
        percentDiscount.toString() +
            '%\n' +
            'Value: ' +
            widget.gameDeal.salePrice.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w600),
      ),
    );
  }
}
