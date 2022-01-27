part of 'comment_bloc.dart';

abstract class CommentsState{}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsSuccess extends CommentsState {
  final List<Comments> commentsList;

  CommentsSuccess(this.commentsList);
}

class CommentsFailure extends CommentsState {
  final String errorMessage;

  CommentsFailure(this.errorMessage);
}