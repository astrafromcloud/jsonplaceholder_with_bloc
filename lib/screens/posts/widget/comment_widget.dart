import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_bloc/logic/posts/models/comments_model.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key, required this.comments}) : super(key: key);

  final Comments comments;

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: (widget.comments as List).length,
        itemBuilder: (BuildContext context, int index) {
          Comments item = (widget.comments as List)[index];
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
                        item.email,
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
                        padding: const EdgeInsets.only(
                            bottom: 18, right: 10),
                        child: Text(
                          item.body,
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
        });
  }
}
