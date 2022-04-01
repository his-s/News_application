import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../home_screen/components/app_bar_title.dart';

class DetailsScreen extends StatefulWidget {
  final String articalUrl;

  const DetailsScreen({Key? key, required this.articalUrl}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late WebViewController controller;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(),
        actions: [
          IconButton(
            onPressed: () async {
              if (await controller.canGoBack()) {
                controller.goBack();
              }
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () async {
              controller.reload();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.green,
            backgroundColor: Colors.white,
          ),
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.articalUrl,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onProgress: (progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
