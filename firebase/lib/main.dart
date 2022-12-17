import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/login_screen.dart';

void main() async{
  // 파이어베이스와 플러터 동기화를 위해 초기화하는 비동기 메서드 - 무조건 필요
  // 초기화 시킨 후 Firebase.initalizeApp() 호출
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}