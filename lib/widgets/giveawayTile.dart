import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/giveaway.dart';
import 'package:url_launcher/url_launcher.dart';

class GiveawayTile extends StatefulWidget {
  Giveaway giveaway;

  GiveawayTile({Key? key, required this.giveaway}) : super(key: key);

  @override
  _GiveawayTileState createState() => _GiveawayTileState();
}

class _GiveawayTileState extends State<GiveawayTile> {
  _launchlink() {
    var url = widget.giveaway.giveawayUrl;
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _launchlink();
      },
      contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      title: Text(widget.giveaway.title),
    );
  }
}
