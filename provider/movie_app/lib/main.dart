import 'package:flutter/material.dart';
import 'package:movie_app/src/home.dart';
import 'package:movie_app/src/provider/count_provider.dart';
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
      home: ChangeNotifierProvider(
        // child 하위 모든 위젯들은 create에서 만든 객체에 접근이 가능
        create: (BuildContext context) =>
            CountProvider() /*{
          return CountProvider();
        }*/
        ,
        child: Home(),
      ),
    );
  }
}
