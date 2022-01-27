import 'package:bloc/bloc.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/posts_model.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/repositories/posts_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRemoteRepository postsRemoteRepository;

  PostBloc(this.postsRemoteRepository) : super(PostsInitial());

  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadPostsList){
      print("I am changing state to LOADING!");
      yield PostsLoading();
      try{
        final List<Posts> postsList = await postsRemoteRepository.getPostsList();
        yield PostsSuccess(postsList);
      }
      catch (e) {
        yield PostsFailure(e.toString());
      }
    }
  }
}