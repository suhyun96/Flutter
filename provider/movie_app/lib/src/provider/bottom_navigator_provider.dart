import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;

  int get currentPage => _index;

  //1페이지인지 2페이지인지 파라미터로 받은 후 _index 값 변경하고 하위 위젯들에게 통보
  updateCurrentPage(int index) {
    _index = index;
    notifyListeners();
  }
}
