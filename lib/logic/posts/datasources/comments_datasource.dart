import 'package:dio/dio.dart';

abstract class CommentsRemoteDataSource{
  Future<Response> getCommentsList();
  Future<Response> getCommentOnly(String postId);
}

class CommentsRemoteDataSourceImpl implements CommentsRemoteDataSource{
  
  Dio dio = Dio();
  
  @override
  Future<Response> getCommentsList() async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/comments');
    return response;
  }

  @override
  Future<Response> getCommentOnly(String postId) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/comments/$postId');
    return response;
  }
  
}