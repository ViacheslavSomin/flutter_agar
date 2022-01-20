import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _baseUrl = 'http://45.77.67.171/client/';

class ClientRoomView extends StatelessWidget {
  const ClientRoomView({
    Key? key,
    required this.roomId,
  }) : super(key: key);

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: '$_baseUrl?room=$roomId',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
