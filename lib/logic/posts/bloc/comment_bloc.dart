import 'package:bloc/bloc.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/comments_model.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/repositories/comments_repository.dart';

part 'comment_state.dart';
part 'comment_event.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {

  final CommentsRemoteRepository commentsRemoteRepository;

  CommentsBloc(this.commentsRemoteRepository) : super(CommentsInitial());

  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    if (event is LoadCommentsList){
      yield CommentsLoading();
      try {
        final List<Comments> commentsList = await commentsRemoteRepository.getCommentsList();
        yield CommentsSuccess(commentsList);
      }
      catch (e) {
        final String errorMessage = e.toString();
        yield CommentsFailure(errorMessage);
      }
    }
  }
}