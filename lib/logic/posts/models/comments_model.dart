import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class Comments{

  int postId;
  int id;
  String name;
  String email;
  String body;

  Comments({
    required this.name,
    required this.id,
    required this.email,
    required this.body,
    required this.postId
});

  factory Comments.fromJson(Map<String, dynamic> json) => _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);

}