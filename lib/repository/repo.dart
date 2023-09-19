import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:ulesson_flutter_retrofit/models/post_model.dart';

part 'repo.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiRepo {
  factory ApiRepo(Dio dio) = _ApiRepo;

  @GET('/posts')
  Future<List<PostModel>> getPosts();
}
