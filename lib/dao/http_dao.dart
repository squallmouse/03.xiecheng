import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xiechengDemo/model/home/home_model.dart';

//连接
const HOMEURL = "http://www.devio.org/io/flutter_app/json/home_page.json";

class HttpDao {
  /// http  传入url ; 返回字典
  static Future<Map?> fetchData(String urlStr) async {
    // 请求 url
    Uri homeUrl = Uri.parse(urlStr);
    // 同步获取请求结果
    var response = await http.get(homeUrl);
    //
    if (response.statusCode == 200) {
      // 请求成功
      Map jsonMap = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      // 返回 Map
      return jsonMap;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception("Request failed with status: ${response.statusCode}.");
    }
    // return null;
  }
}
