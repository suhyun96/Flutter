import 'package:flutter/material.dart';
import 'package:movie_app/src/provider/count_provider.dart';
import 'package:movie_app/src/ui/count_home_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // null safety -> 나중에 널체크
  CountProvider? _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    // 하위 위젯에서 Provider 참조할 때
    if (_countProvider == null) {
      return Scaffold(
        body: Center(
          child: Text('nothing'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Sample'),
      ),
      body: CountHomeWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              // 프로바이더 참조해서 값 변경하도록
              _countProvider!.add();
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _countProvider!.remove();
            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
