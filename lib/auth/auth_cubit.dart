import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hacktu_care_frontend/auth/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState()) {
    _initialize();
  }

  Future<SharedPreferences> getSharedPrefsInstance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<void> _initialize() async {
    debugPrint("here");
    //emit(AuthLoadingState());
    SharedPreferences prefs = await getSharedPrefsInstance();

    if (prefs.getBool('isPatient') == null) {
      emit(AuthInitalState());
    } else {
      debugPrint(prefs.getString('authToken'));
      if (prefs.getString('authToken') == null) {
        emit(SigninState());
      } else {
        emit(AuthenticatedState());
      }
    }
  }

  Future<void> initialRoleSelect(String role) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (role.toLowerCase() == 'patient') {
      prefs.setBool('isPatient', true);
    } else {
      prefs.setBool('isPatient', false);
    }

    emit(SigninState());
  }

  Future<void> login(String email, String password) async {
    try {
      String loginUserAPI = '${dotenv.env['TEST_BASE_URI']}/auth/login-user';

      debugPrint(loginUserAPI);

      final prefs = await getSharedPrefsInstance();
      bool? isPatient = prefs.getBool('isPatient');

      Map<String, dynamic> requestBody = {
        'email': email,
        'password': password,
        'isPatient': isPatient
      };

      final response = await http.post(Uri.parse(loginUserAPI),
          body: json.encode(requestBody),
          headers: {'Content-type': 'application/json'});

      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final prefs = await getSharedPrefsInstance();
        prefs.setString('authToken', decodedResponse['token']);
        debugPrint(prefs.getString('authToken'));
        emit(AuthenticatedState());
      }
    } catch (err) {
      //
    }
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
    prefs.remove('isPatient');
    emit(AuthInitalState());
  }

  void signupEmailChanged(String value) {
    emit((state as SignupState).copyWith(email: value));
  }

  void signupPasswordChanged(String value) {
    emit((state as SignupState).copyWith(password: value));
  }

  void signupConfirmPasswordChanged(String value) {
    emit((state as SignupState).copyWith(confirmPassword: value));
  }

  void signupErrorMessageChanged(String value) {
    emit((state as SignupState).copyWith(errorMessage: value));
  }

  //SigninState value changed methods
  void signinEmailChanged(String value) {
    emit((state as SigninState).copyWith(email: value));
  }

  void signinPasswordChanged(String value) {
    emit((state as SigninState).copyWith(password: value));
  }

  void signinErrorMessageChanged(String value) {
    emit((state as SigninState).copyWith(errorMessage: value));
  }

  void emitSignupState() {
    emit(SignupState());
  }

  void emitSigninState() {
    emit(SigninState());
  }

  Future<void> backToMainPage() async {
    final prefs = await getSharedPrefsInstance();
    prefs.remove('isPatient');
    emit(AuthInitalState());
  }
}
