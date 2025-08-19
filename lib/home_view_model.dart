import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// 상태 클래스 => List 채팅 내역
class Chat {
  final String content;
  final bool isReceived;
  const Chat({
    required this.content,
    required this.isReceived,
  });
}

class HomeViewModel extends Notifier<List<Chat>> {
  @override
  List<Chat> build() {
    return [];
  }

// Gemini SDK 이용할 준비
  final _model = GenerativeModel(
    model: 'gemini-1.5-flase',
    apiKey: const String.fromEnvironment('GEMINI_API_KEY'),
  );

  // Gemini SDK 한테 보내는 함수
  void send(String text) async {
    // 채팅 보낼 때 바로 HomeViewModel이 관리하는 상태 채팅 리스트에 채팅이 하나 추가될 수 있게
    state = [
      ...state,
      Chat(content: text, isReceived: false),
    ];

    // Gemini SDK 요청
    final result = await _model.generateContent([Content.text(text)]);
    // Gemini AI의 응답 메시지가 들어있음
    if (result.text != null) {
      state = [
        ...state,
        Chat(content: result.text!, isReceived: true),
      ];
    }
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Chat>>(
  () => HomeViewModel(),
);
