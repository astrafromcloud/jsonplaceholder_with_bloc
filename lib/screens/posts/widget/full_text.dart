import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_with_bloc/injection_container.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/bloc/comment_bloc.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/comments_model.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/posts_model.dart';

class FullText extends StatefulWidget {
  const FullText({Key? key, required this.posts}) : super(key: key);

  final Posts posts;

  @override
  _FullTextState createState() => _FullTextState();
}

class _FullTextState extends State<FullText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 26, 0, 32),
              child: Text(
                widget.posts.title,
                style: const TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            Text(
              widget.posts.body,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            BlocProvider(
              create: (context) =>
              sl<CommentsBloc>()
                ..add(LoadCommentsList()),
              child: BlocBuilder<CommentsBloc, CommentsState>(
                builder: (context, state){
                  if (state is CommentsInitial){
                    return const Center(
                      child: Text(
                        'This page is Initial!'
                      ),
                    );
                  }
                  if (state is CommentsLoading){
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CommentsSuccess){
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        Comments items = (state.commentsList)[index];
                        return Card(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                            child: Column(children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      items.email,
                                      style: const TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding:
                                      const EdgeInsets.only(bottom: 18, right: 10),
                                      child: Text(
                                        items.body,
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white.withOpacity(0.8)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          ),
                        );
                      },
                    );
                  }
                  if (state is CommentsFailure){
                    return Center(child: Text(state.errorMessage),);
                  }
                  return const Offstage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
