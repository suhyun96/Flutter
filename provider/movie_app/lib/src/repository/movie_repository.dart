// api 서버 호출한 값을 받아오는 부분
import 'dart:convert';

import 'package:movie_app/const/api.dart';

import '../model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    var queryPram = {'api_key': '$apiKey'};

    /// var uri = Uri.https('example.org', '/path', {'q': 'dart'});
    /// print(uri); // https://example.org/path?q=dart

    var uri =
        Uri.https('api.themoviedb.org', '3/movie/popular', queryPram);
    var response = await http.get(uri);
    // 출력값이 있고
    if (response.body != null) {
      // 맵형태로 디코딩
      Map<String, dynamic> body = json.decode(response.body);
      // 결과값 있을 때
      if (body["results"] != null) {
        // map 으로 돌릴려면 개체로
        List<dynamic> list = body["results"];

        return list.map((e) => Movie.fromJson(e)).toList();
      }
    }
    // 값 못 받은 경우 빈걸로
    return [];
  }
}
