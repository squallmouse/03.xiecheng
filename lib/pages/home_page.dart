import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:xiechengDemo/dao/http_dao.dart';
import 'package:xiechengDemo/model/home/banner_model.dart';

import 'package:xiechengDemo/model/home/home_model.dart';

import '../widgets/local_nav.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;
  static const APPBAR_SCROLL_OFFSET = 160;
  HomeModel? _homeModel;
  @override
  void initState() {
    super.initState();
    loadData();
  }

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   方法
//👆🏻*********************************/
// 获取首页数据 方法1
  loadData() {
    HttpDao.fetchData(HOMEURL).then((value) {
      _homeModel = HomeModel.fromjson(value!);
      setState(() {
        // 获取都数据后,刷新界面
      });
    }).catchError((error) {
      debugPrint(error);
    }).whenComplete(() {
      debugPrint("首页数据获取 whenComplete");
    });
  }

// 获取首页数据 方法2
  // loadData2() async {
  //   try {
  //     await HttpDao.fetchData(HOMEURL).then((value) {
  //       _homeModel = HomeModel.fromjson(value!);
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

// 滚动方法
  _onScroll(offset) {
    debugPrint("${offset}");
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _opacity = alpha;
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 主页背景色
      backgroundColor: Color(0xffe2e2e2),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  /*
                        scrollNotification.depth  // 深度
                        如下面的代码 {
                          listview, // 深度为 0
                          swiper  // 深度为 1
                        }
                      */
                  // 滚动且是列表滚动的时候
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return true;
              },
              child: Container(
                child: ListView(
                  children: [
                    //  轮播图
                    ImageSwiper(
                      _homeModel?.bannerList ?? [],
                    ),
                    // 轮播图下面的 nav
                    LocalNav(
                      dataList: _homeModel?.localNavList,
                    ),
                  ],
                ),
              ),
            ),
            // appbar
            // 透明度 变换
            Opacity(
              opacity: _opacity,
              child: Container(
                alignment: Alignment.center,
                child: Text("首页"),
                height: 84,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//*  ------------------------------ */
//*  轮播图

class ImageSwiper extends StatelessWidget {
  //↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   属性
  //👆🏻*********************************/
  List<BannerModel> _imageUrls;

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   方法
//👆🏻*********************************/
  ImageSwiper(this._imageUrls);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        // 轮播图  Swiper
        child: Swiper(
          pagination: _imageUrls.length > 0 ? SwiperPagination() : null,
          onTap: (index) {
            BannerModel bannerModel = _imageUrls[index];
            debugPrint("图片按钮被点击 -- ${bannerModel.url}");
          },
          autoplay: _imageUrls.length > 0 ? true : false, //  是否自动轮播图片
          duration: 1000, // 滑动时间
          autoplayDelay: 5000, //轮播时间
          itemCount: _imageUrls.length, // 图片个数
          itemBuilder: (context, index) {
            BannerModel bannerModel = _imageUrls[index];

            return Image.network(
              bannerModel.icon,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
