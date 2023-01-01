import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final int price = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder'),
      ),
      // 제너릭 타입
      // 스트림빌더는 자체적으로 스트림으로 들어오는 데이터 구독을 위한 기능
      body: StreamBuilder<int>(
        initialData: price,
        // 스트림에서 새로운 데이터 받을 때마다 스냅샷에 저장하고 builder 메서드로 새 데이터 반영한 값으로 빌드
        stream: addStreamValue(),
        // snapshot = 스트림의 결과물
        builder: (context, snapshot) {
          final priceNumber = snapshot.data.toString();
          return Center(
            child: Text(
              priceNumber,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          );
        },
      ),
    );
  }

  Stream<int> addStreamValue() {
    return Stream<int>.periodic(Duration(seconds: 1), (count) => price + count);
  }
}
