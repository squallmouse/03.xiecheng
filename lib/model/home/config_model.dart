// "config": {
// 		"searchUrl": "https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword="
// 	},

class ConfigModel {
  late final String searchUrl;

  // 构造函数
  ConfigModel({
    required this.searchUrl,
  });

  // --
  ConfigModel.fromJson(Map<String, dynamic> json) {
    this.searchUrl = json["searchUrl"];
  }
  // print(this.searchUrl);

}
