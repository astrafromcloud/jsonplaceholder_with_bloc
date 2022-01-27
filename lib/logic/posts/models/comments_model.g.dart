// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      name: json['name'] as String,
      id: json['id'] as int,
      email: json['email'] as String,
      body: json['body'] as String,
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
