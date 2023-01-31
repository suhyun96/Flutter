import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // 앱바랑 백그라운드랑 같은 색깔로
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
