// {
// 			"icon": "http://www.devio.org/io/flutter_app/img/sub_nav_wifi.png",
// 			"title": "WiFi电话卡",
// 			"url": "https://m.ctrip.com/webapp/activity/wifi",
// 			"hideAppBar": true
// 		},

class SubNavModel {
  late final String icon;
  late final String title;
  late final String url;
  late final bool hideAppBar;

  SubNavModel({
    this.icon = "",
    this.title = "",
    this.url = "",
    this.hideAppBar = false,
  });

  SubNavModel.fromjson(Map json) {
    this.icon = json["icon"];
    this.title = json["title"];
    this.url = json["url"];
    this.hideAppBar = json["hideAppBar"];
  }
}
