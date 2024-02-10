import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:web_socket_channel/web_socket_channel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final channel =
      WebSocketChannel.connect(Uri.parse("wss://echo.websocket.org"));
  Future<void> chatWs() async {
    await channel.ready;
    channel.stream.listen((message) {
      _addMessage(
                types.TextMessage(
                  author: types.User(id: _channel.id),
                  id: Random().nextInt(1000).toString(),
                  text: message,
                ),
              );
    });
  }

  @override
  void initState() {
    super.initState();
    chatWs();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _message.insert(0, message);
    });
  }

  final List<types.Message> _message = [];

  final _user = const types.User(id: "82091008-a484-4a89-ae75-a22bf8d6f3ac");

  final _channel = const types.User(id: "82091008-a484-4a89-ae75-a22bf8d6f3acc");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Chat(
            showUserAvatars: true,
            showUserNames: true,
              messages: _message,
              onSendPressed: (val) {
                channel.sink.add(val.text);
                _addMessage(
                  types.TextMessage(
                    author: types.User(id: _user.id),
                    id: Random().nextInt(1000).toString(),
                    text: val.text,
                  ),
                );
              },
              user: _user)),
    );
  }
}
