import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_app/firebase_options.dart';
import 'package:flutter_chatbot_app/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  /// runZonedGuarded 첫 번째 던져준 함수 내에서 발생하는 모든 에러를
  /// 두 번째 넘겨주는 함수 한 군데서 다 처리할 수 있는 함수
  runZonedGuarded(
    () async {
      /// 플러터 앱 내에서 발생하는 모든 에러가 아래 (error, stack) {} 에 들어감
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const ProviderScope(child: MyApp()));
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        // 심각한 에러인지 아닌지 Crashlytics에 알려주는 역할
        fatal: true,
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
