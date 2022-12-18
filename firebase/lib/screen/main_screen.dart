import 'package:flutter/material.dart';

import '../config/palette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // 어느 화면 내보낼지 확인
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      // 위젯 층층이 쌓기
      body: Stack(
        children: [
          // 어디에 위치 시킬지 정함 반드시 child 필요
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300.0,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('asset/image/main.jpg'),
                // 애매하게 덜 채워진 부분 채워줌
                fit: BoxFit.fill,
              )),
              child: Container(
                // 컨테이너 안에서도 패딩 되네 ;
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 20,
                ),
                child: Column(
                  //text를 왼쪽 시작점으로 옮기기
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 한줄에 텍스트 스타일이 다를 떄
                  children: [
                    // 텍스트나 문단을 모아서 구성하게 해줌 TextSpan
                    RichText(
                      text: const TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: ' to Chat',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'signup to continue',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 180.0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: 280,
              // 디바이스 실제 너비값 가지고 와서 사용
              width: MediaQuery.of(context).size.width - 40.0,
              // 마진도 여기서 줄 수 있네
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                // 그림자 효과 : 다양한 색 조합 때문에 리스트
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 눌렀을 때 변화 주기 위해서
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            // inline if
                            // 한 컬랙션 = column 같은 위젯에 속한 위젯들에 예외적 조건을 쉽게 정의 가능
                            // if 밑에 있는 친구들 if에 따라 랜더링 되거나 제외
                            if (!isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.indigo,
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // 사용자가 signup메뉴 선택
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.indigo,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    // 값 유효성 겁사를 위해 Form
                    child: Form(
                      child: Column(
                        children: [
                          // 쉽게 값을 받아오는 장점이 있음
                          TextFormField(
                            // 텍스트 필드 꾸미기
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Palette.iconColor,
                              ),
                              // 텍스트필드를 감싸는 위젯
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              // 텍스트필드가 활성화 상태일 때 테두리 그대로 유지하기 위해서 위에 코드 복붙
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
