import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// webview 返回到携程主页 https://m.ctrip.com/ https://m.ctrip.com/html5/
const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class WebviewPage extends StatefulWidget {
//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
  ///-->   属性
  late String? url;
  final String? statusBarColor;
  final bool? hideAppBar;
  final String? title;
  late bool backForbid; //

//*  ------------------------------ */
//*  方法
  WebviewPage(
      {Key? key,
      required this.url,
      this.statusBarColor,
      this.hideAppBar,
      this.title,
      this.backForbid = false})
      : super(key: key) {
    if (url != null && url!.contains("ctrip.com")) {
      url = url!.replaceAll("http://", "https://");
    }
  }

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  // var _webview = WebviewScaffold(url: url);
  final webviewReference = FlutterWebviewPlugin();
  late StreamSubscription<String> _onUrlChanger;
  late StreamSubscription<WebViewStateChanged> _onStateChanged;
  late StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false; // 是否退出, webview刚进来的时候,是正常显示页面.
  // 当点击返回按钮,
//*  ------------------------------ */
//*  方法

  @override
  void initState() {
    super.initState();
    webviewReference.close();
    //url 改变
    _onUrlChanger = webviewReference.onUrlChanged.listen((url) {
      debugPrint("_onUrlChanger = ${url}");
    });
    // 状态改变
    _onStateChanged =
        webviewReference.onStateChanged.listen((WebViewStateChanged state) {
      debugPrint("bool = ${_isToMain(state.url)}");
      switch (state.type) {
        case WebViewState.startLoad:
          if (_isToMain(state.url) && !exiting) {
            // 如果包含主页,表明下一次去的页面是主页
            if (widget.backForbid) {
              // backForbid = false ; 禁止返回的
              webviewReference.launch(widget.url ?? "http://www.yhhouse.pub");
            } else {
              // 禁止去主页 ;
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
    // http 发生错误
    _onHttpError =
        webviewReference.onHttpError.listen((WebViewHttpError error) {
      debugPrint("httpError = ${error}");
    });
  }

  // dispose
  @override
  void dispose() {
    _onHttpError.cancel();
    _onStateChanged.cancel();
    _onUrlChanger.cancel();
    super.dispose();
  }

// 是否去携程主页
  _isToMain(String? url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

// build 方法
  @override
  Widget build(BuildContext context) {
    print("webview URL = ${widget.url}");
    String statusBarColorStr = widget.statusBarColor ?? "ffffff";
    Color backButtonColor;
    if (statusBarColorStr == "ffffff") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Column(
        children: [
          _statusBar(
              Color(int.parse("0xff" + statusBarColorStr)), backButtonColor),
          Expanded(
            child: WebviewScaffold(
              // url: widget.url["url"],
              url: widget.url ?? "http://www.yhhouse.pub",
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              userAgent: 'null',
              initialChild: Container(
                color: Colors.white,
                child: Center(
                  child: Text("Waiting....."),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// appBar
  _statusBar(Color backgroundColor, Color backButtonColor) {
    // 是否隐藏appBar
    if (widget.hideAppBar ?? false) {
      // appbar  隐藏
      return Container(
        color: backButtonColor,
        height: 30,
      );
    }
    //
    return Container(
      color: backButtonColor,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                child: Text(
                  widget.title ?? "",
                  style: TextStyle(
                    color: backButtonColor,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
