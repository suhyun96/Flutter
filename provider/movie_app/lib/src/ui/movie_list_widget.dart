import 'package:flutter/material.dart';
import 'package:movie_app/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import '../model/movie.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);

  MovieProvider? _movieProvider;

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        // 외부 url을 통해 이미지 가지고 옴
        // 이미지도 11시 7시 방향 둥글게 세팅
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
          child: Image.network(movie.posterUrl),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                movie.title!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              // Expanded로 감싸서 크기를 대충 정하게 한 뒤 만약 heigh를 넘는다면 그 밑으로 빠지는 느낌으로
              Expanded(
                child: Text(
                  movie.overview!,
                  // 글자 넘칠 때 overflow와 maxLineds세팅으로 조절하기
                  overflow: TextOverflow.ellipsis,
                  maxLines: 8,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  )
                ]),
            child: _makeMovieOne(movies[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemCount: movies.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    // false 안하면 없데이트 할 때마다 계속 빌드 시켜서 문제가 발생할 수도 있음
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    if (_movieProvider == null) return Text('nothing');
    _movieProvider!.loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('movie Provider'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if (provider.movies != null && provider.movies.length > 0) {
            print(provider.movies.toString());
            // 프로바이더에 있는 리스트를 넘김
            return _makeListView(provider.movies);
          }

          //loadMovies 이거 호출을 안 한경우 null이니까 로딩바
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
