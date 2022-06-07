// ConfigModel config	Object	NonNull
// List<BannerModel> bannerList	Array	NonNull
// List<LocalNavModel> localNavList	Array	NonNull
// GridNavModel gridNav	Object	NonNull
// List<CommonModel> subNavList	Array	NonNull
// SalesBoxModel salesBox	Object	NonNull

// http://www.devio.org/io/flutter_app/json/home_page.json

// import 'config_model.dart';

import 'package:xiechengDemo/model/home/banner_model.dart';
import 'package:xiechengDemo/model/home/config_model.dart';
import 'package:xiechengDemo/model/home/grid_nav_model.dart';
import 'package:xiechengDemo/model/home/local_nav_model.dart';
import 'package:xiechengDemo/model/home/sales_box_model.dart';
import 'package:xiechengDemo/model/home/sub_nav_model.dart';

class HomeModel {
  // 属性
  late final ConfigModel config;
  late final List<BannerModel> bannerList;
  late final List<LocalNavModel> localNavList;
  late final GridNavModel gridNav;
  late final List<SubNavModel> subNavList;
  late final SalesBoxModel salesBox;
// 构造函数

  HomeModel({
    required this.config,
    required this.bannerList,
    required this.localNavList,
    required this.gridNav,
    required this.subNavList,
    required this.salesBox,
  });

  HomeModel.fromjson(Map json) {
    //1. config
    this.config = ConfigModel.fromJson(json["config"]);

    //2. bannerList
    List tempList = json["bannerList"];
    this.bannerList = tempList.map((dict) {
      return BannerModel.fromjson(dict);
    }).toList();

    //3. localNavList
    tempList = json["localNavList"];
    this.localNavList = tempList.map((dict) {
      return LocalNavModel.fromjson(dict);
    }).toList();

    //4. gridNav
    this.gridNav = GridNavModel.fromjson(json["gridNav"]);

    //5. subNavList
    tempList = json["subNavList"];
    this.subNavList = tempList.map((dict) {
      return SubNavModel.fromjson(dict);
    }).toList();

    //6. salesBox
    this.salesBox = SalesBoxModel.fromjson(json["salesBox"]);
  }
}
