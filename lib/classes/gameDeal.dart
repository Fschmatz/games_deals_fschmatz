import 'package:dynamic_value/dynamic_value.dart';

class GameDeal {
  final String title;
  final String internalName;
  final String storeID;
  final String salePrice;
  final String savings;
  final String dealID;

  GameDeal(
      {required this.title,
      required this.internalName,
      required this.storeID,
      required this.salePrice,
      required this.savings,
      required this.dealID});

  factory GameDeal.fromJson(Map<String, dynamic> json) {
    final value = DynamicValue(json);

    return GameDeal(
      internalName: value["internalName"].toString(),
      title: value["title"].toString(),
      storeID: value["storeID"].toString(),
      dealID: value["dealID"].toString(),
      salePrice: value["salePrice"].toString(),
      savings: value["savings"].toString(),
    );
  }

  @override
  String toString() {
    return 'GameDeal{title: $title, internalName: $internalName, storeID: $storeID, salePrice: $salePrice, savings: $savings}';
  }
}
