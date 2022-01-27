import 'package:dio/dio.dart';

abstract class PostsRemoteDataSource {
  Future<Response> getPostsList();
  Future<Response> getPostOnly(String id);
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getPostsList() async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    print('1111');
    return response;
  }

  @override
  Future<Response> getPostOnly(String id) async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users/$id');
    return response;
  }
}