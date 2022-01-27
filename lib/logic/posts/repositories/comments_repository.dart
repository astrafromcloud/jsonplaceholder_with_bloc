import 'package:dio/dio.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/datasources/comments_datasource.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/comments_model.dart';

abstract class CommentsRemoteRepository{
  Future<List<Comments>> getCommentsList();
  Future<Comments> getCommentOnly(String postId);
}

class CommentsRemoteRepositoryImpl implements CommentsRemoteRepository{

  CommentsRemoteDataSource commentsRemoteDataSource;

  CommentsRemoteRepositoryImpl(this.commentsRemoteDataSource);

  @override
  Future<List<Comments>> getCommentsList() async {
    Response response = await commentsRemoteDataSource.getCommentsList();
    return (response.data as List).map((e) => Comments.fromJson(e)).toList();
  }

  @override
  Future<Comments> getCommentOnly(String postId) async {
    Response response = await commentsRemoteDataSource.getCommentOnly(postId);
    return Comments.fromJson(response.data);
  }


}