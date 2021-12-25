import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/classes/giveaway.dart';
import 'package:share/share.dart';
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
      contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      title: Text(widget.giveaway.title),
      trailing:SizedBox(
        width: 55,
        child: TextButton(
          onPressed: () {
            Share.share( widget.giveaway.giveawayUrl);
          },
          child: Icon(
            Icons.share_outlined,
            size: 20,
            color: Theme.of(context)
                .textTheme
                .headline6!
                .color!
                .withOpacity(0.6),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).cardTheme.color,
            onPrimary: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
