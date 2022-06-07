class GridNavModel {
  //
  late final GridModel hotel;
  late final GridModel flight;
  late final GridModel travel;
  //
  GridNavModel(
      {required this.hotel, required this.flight, required this.travel});

  GridNavModel.fromjson(Map json) {
    this.hotel = GridModel.fromJosn(json["hotel"]);
    this.flight = GridModel.fromJosn(json["flight"]);
    this.travel = GridModel.fromJosn(json["travel"]);
  }
}

class GridModel {
  late final String startColor;
  late final String endColor;
  late final GridNavItem mainItem;
  late final GridNavItem item1;
  late final GridNavItem item2;
  late final GridNavItem item3;
  late final GridNavItem item4;

  GridModel(
      {this.startColor = "",
      this.endColor = "",
      required this.mainItem,
      required this.item1,
      required this.item2,
      required this.item3,
      required this.item4});

  GridModel.fromJosn(Map<String, dynamic> json) {
    this.startColor = json["startColor"];
    this.endColor = json["endColor"];
    this.mainItem = GridNavItem.fromJson(json["mainItem"]);
    this.item1 = GridNavItem.fromJson(json["item1"]);
    ;
    this.item2 = GridNavItem.fromJson(json["item2"]);
    this.item3 = GridNavItem.fromJson(json["item3"]);
    this.item4 = GridNavItem.fromJson(json["item4"]);
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   items的model
//👆🏻*********************************/
class GridNavItem {
  late final String title;
  late final String icon;
  late final String url;
  late final String statusBarColor;
  late final bool hideAppBar;

  GridNavItem(
      {this.title = "",
      this.icon = "",
      this.url = "",
      this.statusBarColor = "",
      this.hideAppBar = false});

  GridNavItem.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.icon = json["icon"];
    this.url = json["url"];
    this.statusBarColor = json["statusBarColor"];
    this.hideAppBar = json["hideAppBar"];
  }
}
