import 'package:flutter/material.dart';
import 'package:movie_app/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ViewCountWidget extends StatelessWidget {
  const ViewCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Center(
      child: Consumer<CountProvider>(builder: (context, provider, child) {
        return Text(
          provider.count.toString(),
          style: TextStyle(fontSize: 80),
        );
      }),
    );
  }
}
