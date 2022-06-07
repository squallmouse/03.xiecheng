// {
// 			"icon": "http://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
// 			"url": "https://gs.ctrip.com/html5/you/travels/1422/3771516.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
// 		},

class BannerModel {
  late final String icon;
  late final String url;

  BannerModel({this.icon = "", this.url = ""});

  BannerModel.fromjson(Map json) {
    this.icon = json["icon"];
    this.url = json["url"];
  }
}
