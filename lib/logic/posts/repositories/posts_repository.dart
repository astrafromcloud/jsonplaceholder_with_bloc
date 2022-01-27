import 'package:dio/dio.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/datasources/posts_datasource.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/posts_model.dart';

abstract class PostsRemoteRepository{
  Future<List<Posts>> getPostsList();
  Future<Posts> getPostOnly(String id);
}

class PostsRemoteRepositoryImpl implements PostsRemoteRepository{
  final PostsRemoteDataSource postsRemoteDataSource;

  PostsRemoteRepositoryImpl(this.postsRemoteDataSource);

  @override
  Future<List<Posts>> getPostsList() async{
    Response response =  await postsRemoteDataSource.getPostsList();
    return (response.data as List).map((e) => Posts.fromJson(e)).toList();
  }

  @override
  Future<Posts> getPostOnly(String id) async {
    Response response = await postsRemoteDataSource.getPostOnly(id);
    return Posts.fromJson(response.data);

  }

}