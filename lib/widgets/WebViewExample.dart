import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../screens/HomeScreen.dart';

class WebViewExample extends StatefulWidget {
  String url;

  WebViewExample({Key? key, required this.url}) : super(key: key);
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff73BFBD),
            ),
            onPressed: () {
              Future.delayed(Duration.zero, () {
                cartScreen.currentState!.popUntil((route) => route.isFirst);
              });

              // Navigator.of(context).pop();
            }),
        title: Text("payment", style: TextStyle(color: Color(0xff73BFBD))),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: 100.w,
        height: 90.h,
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
        ),
      ),
    );
  }
}
