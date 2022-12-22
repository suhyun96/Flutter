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

  final _formKey = GlobalKey<FormState>();

  String userName = '';
  String userEmail = '';
  String userPassword = '';

  // 텍스트폼 유효성 검사를 위해선 crruentState로
  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    // 동작할 때 모든 폼에서 값 받아서 유효성 검사후 넘김

    if (isValid) {
      // 유효성 검사한 폼 전체의 state값 을 저장 -> 각 텍스트폼의 onsaved함수가 호출됨
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      // 위젯 층층이 쌓기
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            // 어디에 위치 시킬지 정함 반드시 child
            // 배경
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
                        text: TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? ' to App' : ' back',
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
                      Text(
                        isSignupScreen
                            ? 'Signup to continue'
                            : 'Signin to continue',
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
            // 텍스트폼필드
            // 애니메이션 효과 넣기
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180.0,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: isSignupScreen ? 280.0 : 250.0,
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
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 30),
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
                      // inline if
                      if (isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          // 값 유효성 겁사를 위해 Form
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // 쉽게 값을 받아오는 장점이 있음
                                TextFormField(
                                  key: ValueKey(1),
                                  //value = 사용자가 입력하는 값
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  // 사용자가 입력한 값을 저장
                                  onSaved: (value) {
                                    userName = value!;
                                  },
                                  onChanged: (value) {
                                    userName = value;
                                  },
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
                                    hintText: 'User name',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    // 텍스트 필드 폭 줄이기
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: ValueKey(2),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !(value.contains('@'))) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value!;
                                  },

                                  // 텍스트 필드 꾸미기
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail,
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
                                    hintText: 'e-mail',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    // 텍스트 필드 폭 줄이기
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  key: ValueKey(3),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 7 characters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  onChanged: (value) {
                                    userPassword = value!;
                                  },
                                  // 텍스트 필드 꾸미기
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
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
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    // 텍스트 필드 폭 줄이기
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      //inline if
                      if (!isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  // 텍스트 필드마다 key를 부여해서 식별할 수 있도록
                                  key: ValueKey(4),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userName = value!;
                                  },
                                  onChanged: (value) {
                                    userName = value!;
                                  },
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
                                    hintText: 'User name',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    // 텍스트 필드 폭 줄이기
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  key: ValueKey(5),
                                  // 텍스트 필드 꾸미기
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 7 characters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  onChanged: (value) {
                                    userPassword = value!;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
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
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    // 텍스트 필드 폭 줄이기
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            // 로그인 버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 390,
              left: 0,
              right: 0,
              //center로 안 감싸면 left 0 right0 부분에서 원이 최대한 자리 차지해버려서 타원되버림
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      _tryValidation();
                      print(userName );
                      print(userPassword);
                      print(userEmail);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent,
                              Colors.indigo,
                            ],
                            // 그라디에이션 효과 방향 지정
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            // 그림자의 거리
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 하단 부분
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen
                  ? MediaQuery.of(context).size.height - 125
                  : MediaQuery.of(context).size.height - 165,
              // left 0 right 0 -> 포지션 위젯이 가로방향 전체 차지하도록
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup with' : 'or Sign with'),
                  SizedBox(
                    height: 10,
                  ),
                  // 아이콘이 배치된 텍스트 버튼
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      // 최소 가로 155 세로 40
                      minimumSize: Size(155, 40),
                      // 버튼 모양잡기
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Palette.googleColor,
                    ),
                    icon: Icon(Icons.add),
                    label: Text('Google'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
