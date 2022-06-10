import 'package:flutter/material.dart';
import 'package:xiechengDemo/model/home/local_nav_model.dart';
import 'package:xiechengDemo/widgets/webview_page.dart';

class LocalNav extends StatefulWidget {
  late final List<LocalNavModel>? dataList;
  LocalNav({Key? key, required this.dataList}) : super(key: key);

  @override
  State<LocalNav> createState() => _LocalNavState();
}

class _LocalNavState extends State<LocalNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //容器的属性
      margin: EdgeInsets.all(10),
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: _items(context, widget.dataList),
    );
  }

  _items(BuildContext context, List<LocalNavModel>? datas) {
    if (datas == null) return null;
    // 处理数据
    List<Widget> items = [];
    datas.forEach((model) {
      items.add(_item(context, model));
    });
    // padding 拉开左右间距
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }

  Widget _item(BuildContext context, LocalNavModel model) {
    // 可以点击
    return InkWell(
      onTap: () {
        debugPrint("click -- ${model.url}");
        // Navigator.pushNamed(context, "/WebviewPage", arguments: test);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return WebviewPage(
                url: model.url,
                statusBarColor: model.statusBarColor,
                hideAppBar: model.hideAppBar,
                title: model.title,
              );
            },
          ),
        );
        ;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            model.icon,
            height: 32,
            width: 32,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
