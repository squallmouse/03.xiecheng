import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiechengDemo/dao/home_dao.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;
  static const APPBAR_SCROLL_OFFSET = 160;

  @override
  void initState() {
    super.initState();
    HomeDao().homeRequest();
  }

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   方法
//👆🏻*********************************/
//
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
                    ImageSwiper(), //  轮播图
                    Container(height: 300, color: Colors.amber), //
                    Container(height: 300, color: Colors.blue),
                    Container(height: 300, color: Colors.red),
                    Container(height: 300, color: Colors.orange),
                    Container(height: 300, color: Colors.purple),
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
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];
//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   方法
//👆🏻*********************************/
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
          pagination: SwiperPagination(),
          autoplay: true, //  是否自动轮播图片
          itemCount: _imageUrls.length, // 图片个数
          itemBuilder: (context, index) {
            return Image.network(
              _imageUrls[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
