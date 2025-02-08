import 'package:hacktu_care_frontend/shared/post.dart';

class CommunityState {}

class CommunityLoadingState extends CommunityState {}

class CommunityLoadedState extends CommunityState {
  List<Post> posts;

  CommunityLoadedState({required this.posts});
}
