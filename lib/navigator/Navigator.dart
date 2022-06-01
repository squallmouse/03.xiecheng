import 'package:flutter/material.dart';
import 'package:xiechengDemo/Pages/home_page.dart';
import 'package:xiechengDemo/Pages/my_page.dart';
import 'package:xiechengDemo/Pages/search_page.dart';
import 'package:xiechengDemo/Pages/travel_page.dart';

// ------
List _iconsData = [
  Icons.home,
  Icons.search,
  Icons.camera_alt,
  Icons.account_circle
];
List _barTitle = ["首页", "搜索", "旅拍", "我的"];

// ------
class TabNavigatorBar extends StatefulWidget {
  TabNavigatorBar({Key? key}) : super(key: key);

  @override
  State<TabNavigatorBar> createState() => _TabNavigatorBarState();
}

class _TabNavigatorBarState extends State<TabNavigatorBar> {
  //↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   属性
  //👆🏻*********************************/
  int _currentPage = 0; // 当前选中页
  final PageController _pageController = PageController(
    initialPage: 0, // 初始化就是0页
  );

  //  nav的items
  List<BottomNavigationBarItem> _bottomNavList =
      List.generate(_barTitle.length, (index) {
    return BottomNavigationBarItem(
      icon: Icon(_iconsData[index], color: Colors.grey),
      activeIcon: Icon(_iconsData[index], color: Colors.blue),
      label: _barTitle[index],
    );
  });

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   方法
//👆🏻*********************************/
// setstate
  _currentPageChange(int index) {
    print(index);
    setState(() {
      _currentPage = index;
    });
  }

// build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _currentPageChange,
        children: [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      //.. 底部的bottomBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.jumpToPage(index); // page
          _currentPageChange(index);
        },
        type: BottomNavigationBarType.fixed,
        items: _bottomNavList,
      ),
    );
  }
}
