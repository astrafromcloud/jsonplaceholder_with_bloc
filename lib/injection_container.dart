import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/bloc/comment_bloc.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/datasources/comments_datasource.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/repositories/comments_repository.dart';

import 'logic/posts/bloc/post_bloc.dart';
import 'logic/posts/datasources/posts_datasource.dart';
import 'logic/posts/repositories/posts_repository.dart';

var sl = GetIt.instance;

void initGetIt() async {
  sl.registerFactory<PostBloc>(() => PostBloc(sl()));

  sl.registerLazySingleton<PostsRemoteRepository>(() => PostsRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImpl());

  sl.registerFactory<CommentsBloc>(() => CommentsBloc(sl()));

  sl.registerLazySingleton<CommentsRemoteRepository>(() => CommentsRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<CommentsRemoteDataSource>(() => CommentsRemoteDataSourceImpl());
}