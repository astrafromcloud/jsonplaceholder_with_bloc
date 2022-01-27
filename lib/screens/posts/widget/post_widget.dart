import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/bloc/post_bloc.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/posts_model.dart';
import 'package:jsonplaceholder_with_bloc/screens/posts/widget/full_text.dart';

import '../../../injection_container.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostBloc>()..add(LoadPostsList()),
      child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostsInitial){
              return const Center(
                child: Text('This is Initial page!'),
              );
            }
            if (state is PostsLoading){
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is PostsSuccess){
              return ListView.builder(
                itemCount: state.postsList.length,
                  itemBuilder: (context, index) {
                    Posts item = state.postsList[index];
                    return Card(
                      child: ListTile(
                        tileColor: const Color(0xFF221C44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        title: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            ),
                          ),
                        ),
                        subtitle: Text(
                          item.body,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.8)
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FullText(posts: item,)));
                        },
                      ),
                    );
                  }
              );
            }
            if (state is PostsFailure) {
              return Center(
                child: Text(
                  state.errorMessage
                ),
              );
            }
            return const Offstage();
          },
        ),
    );
  }
}
