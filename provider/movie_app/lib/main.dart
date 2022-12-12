import 'package:flutter/material.dart';
import 'package:movie_app/src/home.dart';
import 'package:movie_app/src/provider/bottom_navigator_provider.dart';
import 'package:movie_app/src/provider/count_provider.dart';
import 'package:movie_app/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        // [] 안에 있는 리스트들은 하위 위젯이 참고 가능
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => CountProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider()),
        ],

        child: Home(),
      ),
    );
  }
}
