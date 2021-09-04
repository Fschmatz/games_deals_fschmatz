import 'package:dynamic_value/dynamic_value.dart';

class Giveaway {
  final String title;
  final String id;
  final String giveawayUrl;
  final String platforms;
  Giveaway(
      {required this.title,
        required this.id,
        required this.platforms,
        required this.giveawayUrl});

  factory Giveaway.fromJson(Map<String, dynamic> json) {
    final value = DynamicValue(json);

    return Giveaway(
        id: value["id"].toString(),
        title: value["title"].toString(),
        platforms: value["platforms"].toString(),
        giveawayUrl: value["open_giveaway_url"].toString()
    );
  }

  @override
  String toString() {
    return 'Giveaway{title: $title, id: $id, giveawayUrl: $giveawayUrl, platforms: $platforms}';
  }
}
