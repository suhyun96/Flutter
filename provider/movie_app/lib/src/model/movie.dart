// api 요청에 의해 받은 값의 형태를 정의
// 이미지 poster_path, 제목 title, 설명이 필요 overview
class Movie {
  String? overview;
  String? posterPath;
  String? title;

  Movie({this.overview, this.posterPath, this.title});

  //json으로 들어온 거를 파싱할 필요가 있음
  //map 타입으로 들어옴
  //factory 패턴
  factory Movie.fromJson(Map<String, dynamic> json) {
    // movie 객체 생성
    return Movie(
      // json 형태에서 overview로 파싱하고 문자열로 넣음
      overview:json["overview"] as String,
      posterPath:json["poster_path"] as String,
      title:json["title"] as String,
    );
  }

  String get posterUrl => "https://image.tmdb.org/t/p/w500/${this.posterPath}";
}
