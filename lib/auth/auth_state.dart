import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';

part 'auth_state.g.dart';

class AuthState {}

class AuthInitalState extends AuthState {}

@CopyWith()
class SigninState extends AuthState {
  String? email;
  String? password;
  String? errorMessage;

  SigninState({this.email, this.password, this.errorMessage});
}

@CopyWith()
class SignupState extends AuthState {
  String? email;
  String? password;
  String? confirmPassword;
  String? errorMessage;

  SignupState(
      {this.email, this.password, this.confirmPassword, this.errorMessage});
}

@CopyWith()
class PatientOnboardingState extends AuthState {
  String? name;
  String? email;
  String? password;
  PlatformFile? profileImage;
  String? phone;
  DateTime? dob;
  String? gender;
  String? height;
  String? weight;
  List<String>? allergies;
  List<String>? preExistingConditions;
  String? contact1Name;
  String? contact1Number;
  String? contact1Relation;
  String? contact2Name;
  String? contact2Number;
  String? contact2Relation;

  PatientOnboardingState(
      {this.name,
      this.email,
      this.password,
      this.profileImage,
      this.phone,
      this.dob,
      this.gender,
      this.height,
      this.weight,
      this.allergies,
      this.preExistingConditions,
      this.contact1Name,
      this.contact1Number,
      this.contact1Relation,
      this.contact2Name,
      this.contact2Number,
      this.contact2Relation});
}

@CopyWith()
class CaregiverOnboarding extends AuthState {
  String? name;
  String? emailId;
  String? phone;
  PlatformFile? profilePicture;
  List<String>? patientEmails;

  CaregiverOnboarding(
      {this.name,
      this.emailId,
      this.phone,
      this.profilePicture,
      this.patientEmails});
}

class AuthenticatedState extends AuthState {}
