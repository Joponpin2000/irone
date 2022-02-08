import 'package:irone/models/message.dart';
import 'package:irone/widgets/molecules/message_tile.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  final List<Message> messagesList;
  const MessagesList({Key? key, required this.messagesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: messagesList.map((msg) => MessageTile(message: msg)).toList(),
    );
  }
}
