import 'package:dynamic_value/dynamic_value.dart';

class SearchedGameDeal {
  final String title;
  final String internalName;
  final String salePrice;
  final String dealID;

  SearchedGameDeal(
      {required this.title,
      required this.internalName,
      required this.salePrice,
      required this.dealID});

  factory SearchedGameDeal.fromJson(Map<String, dynamic> json) {
    final value = DynamicValue(json);

    return SearchedGameDeal(
      internalName: value["internalName"].toString(),
      title: value["external"].toString(),
      dealID: value["cheapestDealID"].toString(),
      salePrice: value["cheapest"].toString()
    );
  }

  @override
  String toString() {
    return 'GameDeal{title: $title, internalName: $internalName, salePrice: $salePrice}';
  }
}
