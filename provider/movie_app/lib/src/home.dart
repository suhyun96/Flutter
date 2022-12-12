import 'package:flutter/material.dart';
import 'package:movie_app/src/provider/bottom_navigator_provider.dart';
import 'package:movie_app/src/provider/count_provider.dart';
import 'package:movie_app/src/ui/count_home_widget.dart';
import 'package:movie_app/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // null safety -> 나중에 널체크
  //CountProvider? _countProvider;
  BottomNavigationProvider? _bottomNavigationProvider;

  Widget _navigationBody() {
    // 해당 Home클래스 내부에 _bottomNavigationProvider으로 멤버 변수가 있으니까 어떤 위젯에서도 가져와서 사용이 가능
    // 훨씬 편하네 ;;
    switch(_bottomNavigationProvider!.currentPage){
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'movie'),
      ], // 현재 선택은 0으로 초기화
      currentIndex: _bottomNavigationProvider!.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        // provider navigation state변경 ;
        // 짜피 빌드 단에서 널체크 하니까 !
        _bottomNavigationProvider!.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    // 하위 위젯에서 Provider 참조할 때
    if (_bottomNavigationProvider == null) {
      return Scaffold(
        body: Center(
          child: Text('nothing'),
        ),
      );
    }

    return Scaffold(

      body: _navigationBody(),
      // 네비게이션바
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}

