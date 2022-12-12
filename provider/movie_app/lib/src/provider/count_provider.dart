import 'package:flutter/cupertino.dart';

//해당 클래스 안에서 선언된 멤버변수 상태관리를 provider가 하도록
class CountProvider extends ChangeNotifier {
  // 외부 접근 금지
  int _count = 0;

  // 외부 접근금지 변수를 getter로 끄내기
  int get count => _count;

  //String value = "test";

  add() {
    _count++;
    // 변경됨을 알려줘야함  브로드캐스팅해서 알려줌
    notifyListeners();
  }

  remove() {
    _count--;
    notifyListeners();
  }
}
