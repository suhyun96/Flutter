import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //우상단 디버그 배너 삭제
      debugShowCheckedModeBanner: false,
      //HomeScreen 안에 있는 빌드 메서드가 불러옴
      home: HomeScreen(),
    ),
  );
}

// 모든 위젯은 클래스
class HomeScreen extends StatelessWidget {
  // 오버라이딩 해야하는 build 함수
  @override
  Widget build(BuildContext context) {
    // 안에 원하는 위젯 넣어주기
    // wiget을 리턴함
    // 핫리로드는 build 함수에 있는 것만 재실행 지금까지는 하드코딩해서 못했는데 이제는 하나의 위젯으로 묶어서 사용가능
    return Scaffold(
      //backgroundColor: Colors.orange,
      backgroundColor: Color(0xFFF99231),
      //body: Center 의 경우 child 하나만 가능
      //body: Column 의 경우 children으로 여러개 가능
      //column은 세로로 위젯들을 정렬 반대는 row  linearlayer 느낌인가
      body: Column(
        //주축(세로) 정렬
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //가장위에 위젯들이 세팅됨
          Image.asset(
            'asset/img/logo.png',
          ),
          //로딩바
          // 동그라미 진행상황 표시
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
