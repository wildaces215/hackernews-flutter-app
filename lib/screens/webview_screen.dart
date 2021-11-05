import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share_plus/share_plus.dart';

class WebviewScreen extends StatelessWidget {
  const WebviewScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.backspace)),
            title: InkWell(
              child: Text(url),
              onLongPress: () {
                Share.share(url);
              },
            )),
        body: SafeArea(
            child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.disabled,
        )));
  }
}
