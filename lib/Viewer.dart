import 'package:flutter/material.dart';
import "package:flutter_webview_plugin/flutter_webview_plugin.dart";

class Viewer extends StatelessWidget {

    static var currentUrl = "";

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(url: currentUrl);
  }

}