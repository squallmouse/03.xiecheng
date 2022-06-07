import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xiechengDemo/model/home/home_model.dart';

class HomeDao {
  // http
  Future<Map?> homeRequest() async {
    // 请求 url
    Uri homeUrl =
        Uri.parse("http://www.devio.org/io/flutter_app/json/home_page.json");
    // 同步获取请求结果
    var response = await http.get(homeUrl);
    //
    if (response.statusCode == 200) {
      // 请求成功
      Map jsonMap = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print("jsonMap -- $jsonMap");
      print("??????????????");
      test(jsonMap);
      return jsonMap;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
  //

  void test(Map dict) {
    HomeModel homeModel = HomeModel.fromjson(dict);
    print(homeModel.config.searchUrl);
  }
}
