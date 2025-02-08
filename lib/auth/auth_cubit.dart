import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    SharedPreferences prefs = await getSharedPrefsInstance();

    if (prefs.getBool('isPatient') == null) {
      emit(AuthInitalState());
    } else {
      emit(SigninState());
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

  Future<void> login(String email, String password) async {}

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
