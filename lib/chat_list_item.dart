import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    required this.content,
    required this.isReceived,
  });
  final String content;
  // 받은 메시지 왼쪽 보낸 메시지 오른쪽 확인할 수 있게
  final bool isReceived;
  @override
  Widget build(BuildContext context) {
    return Align(
      // 받은 메시지 왼쪽 보낸 메시지 오른쪽 확인할 수 있게
      alignment: isReceived ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: isReceived ? Colors.purple[200] : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          content,
          style: TextStyle(
            fontSize: 16,
            color: isReceived ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
