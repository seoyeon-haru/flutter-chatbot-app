import 'package:flutter/material.dart';
import 'package:flutter_chatbot_app/chat_list_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatListItem(
                      content: 'content',
                      // 가짜 데이터 짝수면 내가 받은걸로 설정
                      isReceived: index.isEven,
                    );
                  },
          
                  /// 각각의 ChatListItem 간격
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: MaterialStateOutlineInputBorder.resolveWith(
                    (states) {
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          /// ! 붙는 이유는 BorderSide 외곽선이라 무조건 색상이 nullable 이 아니어야 되기 때문
                          color: Colors.purple[100]!,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
