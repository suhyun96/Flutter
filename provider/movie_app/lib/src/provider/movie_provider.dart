import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/repository/movie_repository.dart';

import '../model/movie.dart';

// 해당 프로바이더는 레파지토리에서 값을 받고 이를 movies 리스트에 넣은 다음 이를 사용
class MovieProvider extends ChangeNotifier {

  MovieRepository _movieRepository = MovieRepository();

  // response가 리스트 형태
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  loadMovies() async{
    //repository 접근해서 데이터 불러오기
    List<Movie> listMovies = await _movieRepository.loadMovies();
    _movies=listMovies;
    notifyListeners();
  }


}
