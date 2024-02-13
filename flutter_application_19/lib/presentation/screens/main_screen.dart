import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String name = "";
  String s = "";
  String p = "";
  String e = "";
  String e = "";

  late WebSocketChannel channel;
  @override
  void initState() {
    super.initState();
    final wbsUrl = Uri.parse("wss://stream.binance.com:9443/ws/etheur@trade");
    channel = WebSocketChannel.connect(wbsUrl);
    channel.stream.listen((message) {
      Map<String, dynamic> valueMap = json.decode(message);
      name = valueMap["e"];
      s = valueMap["s"];
      p = valueMap["p"];
      e = valueMap["e"];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 30, color: Colors.red),
          ),
          Text(
            s,
            style: const TextStyle(fontSize: 30, color: Colors.red),
          ),

          Text(
            p,
            style: const TextStyle(fontSize: 30, color: Colors.red),
          ),

          Text(
            e,
            style: const TextStyle(fontSize: 30, color: Colors.red),
          ),
        ],
      ),
    ));
  }
}
