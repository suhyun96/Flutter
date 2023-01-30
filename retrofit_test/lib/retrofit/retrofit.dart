import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/topstories.json')
  // async
  Future<List<int>> getTopNews();

  @GET('/item/{id}.json?print=pretty')
  // news객체
  Future<News> getNewsDetail({@Path() int id});
}

@JsonSerializable()
// 안에 사용하고 싶은 항목들을 넣고 가져오면 됨
class News {
  int? id;
  String? title;
  String? type;
  String? url;

  News({this.id, this.title, this.type, this.url});

  // 요건 그냥 해야하는 거라는데
  // 패턴 느낌이네 하나는 객체로 하나는 제이슨으로 만들기
  factory News.fromJson(Map<String , dynamic> json )=> _$NewsFormJson(json);

  Map<String,dynamic> toJson() => _$NewsToJson(this);
}
