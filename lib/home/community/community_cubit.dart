import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hacktu_care_frontend/home/community/community_state.dart';
import 'package:hacktu_care_frontend/shared/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityState()) {
    emit(CommunityLoadedState(posts: []));
  }

  Future<String?> getSharedPreferencesInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> fetchPosts() async {
    try {
      String fetchPostsUri = '${dotenv.env['TEST_BASE_URI']}/forum/get-posts';

      String? authToken = await getSharedPreferencesInstance();

      final response = await http.get(Uri.parse(fetchPostsUri), headers: {
        'Content-type': 'application/json',
        'Authorization': 'bearer $authToken'
      });

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        List<Post> posts = [];
        final decodedResponse = jsonDecode(response.body);
        debugPrint(decodedResponse.toString());
        for (var postObject in decodedResponse['posts']) {
          debugPrint("Post Object Type: ${postObject.runtimeType}");
          debugPrint("Post Object Data: ${jsonEncode(postObject)}");
        }

        debugPrint(posts.length.toString());

        emit(CommunityLoadedState(posts: posts));
      }
    } catch (err) {
      //
    }
  }
}
