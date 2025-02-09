import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hacktu_care_frontend/home/community/add_post/post_state.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PostCubit extends Cubit<AddPostState> {
  PostCubit() : super(AddPostState());

  Future<void> addPost(
      String title, String postBody, String tag, PlatformFile? image) async {
    String addPostUri = '${dotenv.env['TEST_BASE_URI']}/forum/add-post';

    if (image != null) {
      //final storageRef = await Firebase
    }

    Map<String, dynamic> requestBody = {
      'title': title,
      'postBody': postBody,
      'tag': tag.toLowerCase()
    };

    String? authToken = await getAuthToken();

    final response = await http.post(Uri.parse(addPostUri),
        body: json.encode(requestBody),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $authToken'
        });

    debugPrint(response.statusCode.toString());
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');
    return authToken;
  }

  void titleChanged(String value) {
    emit(state.copyWith(title: value));
  }

  void postBodyChanged(String value) {
    emit(state.copyWith(postBody: value));
  }

  void tagChanged(String value) {
    emit(state.copyWith(tag: value));
  }

  void postImageChanged(PlatformFile? image) {
    emit(state.copyWith(postImage: image));
  }
}
