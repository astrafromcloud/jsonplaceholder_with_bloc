part of 'post_bloc.dart';

abstract class PostState{}

class PostsInitial extends PostState {}

class PostsLoading extends PostState {}

class PostsSuccess extends PostState {
  final List<Posts> postsList;

  PostsSuccess(this.postsList);
}

class PostsFailure extends PostState {
  final String errorMessage;

  PostsFailure(this.errorMessage);
}