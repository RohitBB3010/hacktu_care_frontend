// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['postId'] as String,
      title: json['title'] as String,
      postBody: json['postBody'] as String,
      tag: json['tag'] as String,
      postDate: json['postDate'] as String,
      caregiverName: json['caregiverName'] as String,
      caregiverPfp: json['caregiverPfp'] as String?,
      postImage: json['postImage'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.id,
      'title': instance.title,
      'postBody': instance.postBody,
      'tag': instance.tag,
      'postDate': instance.postDate,
      'caregiverName': instance.caregiverName,
      'caregiverPfp': instance.caregiverPfp,
      'postImage': instance.postImage,
      'comments': instance.comments,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      commentorTitle: json['commentorTitle'] as String,
      commentorReply: json['commentorReply'] as String,
      commentorPfp: json['commentorPfp'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'commentorTitle': instance.commentorTitle,
      'commentorReply': instance.commentorReply,
      'commentorPfp': instance.commentorPfp,
    };
