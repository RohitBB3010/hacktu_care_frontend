import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'postId')
  String id;
  String title;
  String postBody;
  String tag;
  String postDate;
  String caregiverName;
  String? caregiverPfp;
  String? postImage;
  List<Comment>? comments;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Post(
      {required this.id,
      required this.title,
      required this.postBody,
      required this.tag,
      required this.postDate,
      required this.caregiverName,
      this.caregiverPfp,
      this.postImage,
      this.comments});

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class Comment {
  String commentorTitle;
  String commentorReply;
  String commentorPfp;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Comment(
      {required this.commentorTitle,
      required this.commentorReply,
      required this.commentorPfp});

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
