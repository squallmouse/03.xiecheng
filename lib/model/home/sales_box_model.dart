// "icon": "http://www.devio.org/io/flutter_app/img/sales_box_huodong.png",
// 		"moreUrl": "https://contents.ctrip.com/activitysetupapp/mkt/index/moreact",
// 		"bigCard1": {
// 			"icon": "https://dimg04.c-ctrip.com/images/700t0y000000m71h523FE_375_260_342.png",
// 			"url": "https://contents.ctrip.com/buildingblocksweb/special/membershipcard/index.html?sceneid=1&productid=14912&ishidenavbar=yes&pushcode=act_svip_hm31",
// 			"title": "活动"
// 		},

class SalesBoxModel {
  late final String icon;
  late final String moreUrl;
  late final CardItem bigCard1;
  late final CardItem bigCard2;
  late final CardItem smallCard1;
  late final CardItem smallCard2;
  late final CardItem smallCard3;
  late final CardItem smallCard4;

  SalesBoxModel({
    this.icon = "",
    this.moreUrl = "",
    required this.bigCard1,
    required this.bigCard2,
    required this.smallCard1,
    required this.smallCard2,
    required this.smallCard3,
    required this.smallCard4,
  });

  SalesBoxModel.fromjson(Map json) {
    this.icon = json["icon"];
    this.moreUrl = json["moreUrl"];
    this.bigCard1 = CardItem.fromjson(json["bigCard1"]);
    this.bigCard2 = CardItem.fromjson(json["bigCard2"]);
    this.smallCard1 = CardItem.fromjson(json["smallCard1"]);
    this.smallCard2 = CardItem.fromjson(json["smallCard2"]);
    this.smallCard3 = CardItem.fromjson(json["smallCard3"]);
    this.smallCard4 = CardItem.fromjson(json["smallCard4"]);
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   item model
//👆🏻*********************************/
class CardItem {
  late final String icon;
  late final String url;
  late final String title;

  //
  CardItem({this.icon = "", this.url = "", this.title = ""});

  CardItem.fromjson(Map json) {
    this.icon = json["icon"];
    this.url = json["url"];
    this.title = json["title"];
  }
}
