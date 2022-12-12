import 'package:flutter/material.dart';
import 'package:movie_app/src/components/view_count.dart';
import 'package:movie_app/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);

  CountProvider? _countProvider;

  @override
  Widget build(BuildContext context) {
    // 업뎃이 불필요 여기선 그냥 값 건드리는 것 뿐
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    if (_countProvider == null) return Text("Nothing....");

    return Scaffold(
      appBar: AppBar(
        title: Text('Count Provider'),
      ),
      body: ViewCountWidget(),
      // 네비게이션바
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
