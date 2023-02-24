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
  _launchLink() {
    var url = widget.giveaway.giveawayUrl;
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      child: ListTile(
        onTap: () {
          _launchLink();
        },
        onLongPress: () {
          Share.share(widget.giveaway.giveawayUrl);
        },
        contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        title: Text(
          widget.giveaway.title,
        ),
        subtitle: widget.giveaway.endDate.isEmpty || widget.giveaway.endDate == "N/A"
          ? Text("From ${widget.giveaway.getFormattedPublishedDate()}", style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor),)
          : Text("From ${widget.giveaway.getFormattedPublishedDate()} to ${widget.giveaway.getFormattedEndDate()}" ,
          style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor),),
      ),
    );
  }
}
