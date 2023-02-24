import 'package:dynamic_value/dynamic_value.dart';
import 'package:jiffy/jiffy.dart';

class Giveaway {
  final String title;
  final String id;
  final String giveawayUrl;
  final String platforms;
  final String publishedDate;
  final String endDate;

  Giveaway(
      {required this.title,
        required this.id,
        required this.platforms,
        required this.giveawayUrl,
        required this.publishedDate,
        required this.endDate});

  factory Giveaway.fromJson(Map<String, dynamic> json) {
    final value = DynamicValue(json);

    return Giveaway(
        id: value["id"].toString(),
        title: value["title"].toString(),
        platforms: value["platforms"].toString(),
        giveawayUrl: value["open_giveaway_url"].toString(),
        publishedDate: value["published_date"].toString(),
        endDate: value["end_date"].toString(),
    );
  }

  String getFormattedPublishedDate() {
    return Jiffy(publishedDate).format("dd MMM yyyy").toString();
  }

  String getFormattedEndDate() {
    return Jiffy(endDate).format("dd MMM yyyy").toString();
  }

  @override
  String toString() {
    return 'Giveaway{title: $title, id: $id, giveawayUrl: $giveawayUrl, platforms: $platforms}';
  }
}
