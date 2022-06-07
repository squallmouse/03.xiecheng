// {
// 			"icon": "http://www.devio.org/io/flutter_app/img/ln_ticket.png",
// 			"title": "攻略·景点",
// 			"url": "https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
// 			"statusBarColor": "1070b8",
// 			"hideAppBar": true
// 		},

class LocalNavModel {
  late final String icon;
  late final String title;
  late final String url;
  late final String statusBarColor;
  late final bool hideAppBar;

  LocalNavModel(
      {this.icon = "",
      this.title = "",
      this.url = "",
      this.statusBarColor = "",
      this.hideAppBar = false});

  LocalNavModel.fromjson(Map json) {
    this.icon = json["icon"];
    this.title = json["title"];
    this.url = json["url"];
    this.statusBarColor = json["statusBarColor"];
    this.hideAppBar = json["hideAppBar"];
  }
}
