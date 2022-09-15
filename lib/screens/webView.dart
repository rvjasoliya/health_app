import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewLoad extends StatefulWidget {
  WebViewLoadUI createState() => WebViewLoadUI();
}

class WebViewLoadUI extends State<WebViewLoad>{

  WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        // title: Text(arg['title'], style: TextStyle(
        //
        // ),),
        backgroundColor: AppColors.primaryColor,
          elevation: 0,
      ),
      body: WebView(
        initialUrl: 'https://www.google.com/', //arg['link'],
        onWebViewCreated: (WebViewController tmp) {
          webViewController = tmp;
          //loadLocalHTML();
        },
      ),
    );
  }
}