// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SigninStateCWProxy {
  SigninState email(String? email);

  SigninState password(String? password);

  SigninState errorMessage(String? errorMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SigninState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SigninState(...).copyWith(id: 12, name: "My name")
  /// ````
  SigninState call({
    String? email,
    String? password,
    String? errorMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSigninState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSigninState.copyWith.fieldName(...)`
class _$SigninStateCWProxyImpl implements _$SigninStateCWProxy {
  const _$SigninStateCWProxyImpl(this._value);

  final SigninState _value;

  @override
  SigninState email(String? email) => this(email: email);

  @override
  SigninState password(String? password) => this(password: password);

  @override
  SigninState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SigninState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SigninState(...).copyWith(id: 12, name: "My name")
  /// ````
  SigninState call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
  }) {
    return SigninState(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
    );
  }
}

extension $SigninStateCopyWith on SigninState {
  /// Returns a callable class that can be used as follows: `instanceOfSigninState.copyWith(...)` or like so:`instanceOfSigninState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SigninStateCWProxy get copyWith => _$SigninStateCWProxyImpl(this);
}

abstract class _$SignupStateCWProxy {
  SignupState email(String? email);

  SignupState password(String? password);

  SignupState confirmPassword(String? confirmPassword);

  SignupState errorMessage(String? errorMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignupState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignupState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignupState call({
    String? email,
    String? password,
    String? confirmPassword,
    String? errorMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignupState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSignupState.copyWith.fieldName(...)`
class _$SignupStateCWProxyImpl implements _$SignupStateCWProxy {
  const _$SignupStateCWProxyImpl(this._value);

  final SignupState _value;

  @override
  SignupState email(String? email) => this(email: email);

  @override
  SignupState password(String? password) => this(password: password);

  @override
  SignupState confirmPassword(String? confirmPassword) =>
      this(confirmPassword: confirmPassword);

  @override
  SignupState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignupState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignupState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignupState call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? confirmPassword = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
  }) {
    return SignupState(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      confirmPassword: confirmPassword == const $CopyWithPlaceholder()
          ? _value.confirmPassword
          // ignore: cast_nullable_to_non_nullable
          : confirmPassword as String?,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
    );
  }
}

extension $SignupStateCopyWith on SignupState {
  /// Returns a callable class that can be used as follows: `instanceOfSignupState.copyWith(...)` or like so:`instanceOfSignupState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SignupStateCWProxy get copyWith => _$SignupStateCWProxyImpl(this);
}

abstract class _$PatientOnboardingStateCWProxy {
  PatientOnboardingState name(String? name);

  PatientOnboardingState email(String? email);

  PatientOnboardingState password(String? password);

  PatientOnboardingState profileImage(PlatformFile? profileImage);

  PatientOnboardingState phone(String? phone);

  PatientOnboardingState dob(DateTime? dob);

  PatientOnboardingState gender(String? gender);

  PatientOnboardingState height(String? height);

  PatientOnboardingState weight(String? weight);

  PatientOnboardingState allergies(List<String>? allergies);

  PatientOnboardingState preExistingConditions(
      List<String>? preExistingConditions);

  PatientOnboardingState contact1Name(String? contact1Name);

  PatientOnboardingState contact1Number(String? contact1Number);

  PatientOnboardingState contact1Relation(String? contact1Relation);

  PatientOnboardingState contact2Name(String? contact2Name);

  PatientOnboardingState contact2Number(String? contact2Number);

  PatientOnboardingState contact2Relation(String? contact2Relation);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatientOnboardingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatientOnboardingState(...).copyWith(id: 12, name: "My name")
  /// ````
  PatientOnboardingState call({
    String? name,
    String? email,
    String? password,
    PlatformFile? profileImage,
    String? phone,
    DateTime? dob,
    String? gender,
    String? height,
    String? weight,
    List<String>? allergies,
    List<String>? preExistingConditions,
    String? contact1Name,
    String? contact1Number,
    String? contact1Relation,
    String? contact2Name,
    String? contact2Number,
    String? contact2Relation,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPatientOnboardingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPatientOnboardingState.copyWith.fieldName(...)`
class _$PatientOnboardingStateCWProxyImpl
    implements _$PatientOnboardingStateCWProxy {
  const _$PatientOnboardingStateCWProxyImpl(this._value);

  final PatientOnboardingState _value;

  @override
  PatientOnboardingState name(String? name) => this(name: name);

  @override
  PatientOnboardingState email(String? email) => this(email: email);

  @override
  PatientOnboardingState password(String? password) => this(password: password);

  @override
  PatientOnboardingState profileImage(PlatformFile? profileImage) =>
      this(profileImage: profileImage);

  @override
  PatientOnboardingState phone(String? phone) => this(phone: phone);

  @override
  PatientOnboardingState dob(DateTime? dob) => this(dob: dob);

  @override
  PatientOnboardingState gender(String? gender) => this(gender: gender);

  @override
  PatientOnboardingState height(String? height) => this(height: height);

  @override
  PatientOnboardingState weight(String? weight) => this(weight: weight);

  @override
  PatientOnboardingState allergies(List<String>? allergies) =>
      this(allergies: allergies);

  @override
  PatientOnboardingState preExistingConditions(
          List<String>? preExistingConditions) =>
      this(preExistingConditions: preExistingConditions);

  @override
  PatientOnboardingState contact1Name(String? contact1Name) =>
      this(contact1Name: contact1Name);

  @override
  PatientOnboardingState contact1Number(String? contact1Number) =>
      this(contact1Number: contact1Number);

  @override
  PatientOnboardingState contact1Relation(String? contact1Relation) =>
      this(contact1Relation: contact1Relation);

  @override
  PatientOnboardingState contact2Name(String? contact2Name) =>
      this(contact2Name: contact2Name);

  @override
  PatientOnboardingState contact2Number(String? contact2Number) =>
      this(contact2Number: contact2Number);

  @override
  PatientOnboardingState contact2Relation(String? contact2Relation) =>
      this(contact2Relation: contact2Relation);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatientOnboardingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatientOnboardingState(...).copyWith(id: 12, name: "My name")
  /// ````
  PatientOnboardingState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? profileImage = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? dob = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
    Object? allergies = const $CopyWithPlaceholder(),
    Object? preExistingConditions = const $CopyWithPlaceholder(),
    Object? contact1Name = const $CopyWithPlaceholder(),
    Object? contact1Number = const $CopyWithPlaceholder(),
    Object? contact1Relation = const $CopyWithPlaceholder(),
    Object? contact2Name = const $CopyWithPlaceholder(),
    Object? contact2Number = const $CopyWithPlaceholder(),
    Object? contact2Relation = const $CopyWithPlaceholder(),
  }) {
    return PatientOnboardingState(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      profileImage: profileImage == const $CopyWithPlaceholder()
          ? _value.profileImage
          // ignore: cast_nullable_to_non_nullable
          : profileImage as PlatformFile?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      dob: dob == const $CopyWithPlaceholder()
          ? _value.dob
          // ignore: cast_nullable_to_non_nullable
          : dob as DateTime?,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String?,
      height: height == const $CopyWithPlaceholder()
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as String?,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as String?,
      allergies: allergies == const $CopyWithPlaceholder()
          ? _value.allergies
          // ignore: cast_nullable_to_non_nullable
          : allergies as List<String>?,
      preExistingConditions:
          preExistingConditions == const $CopyWithPlaceholder()
              ? _value.preExistingConditions
              // ignore: cast_nullable_to_non_nullable
              : preExistingConditions as List<String>?,
      contact1Name: contact1Name == const $CopyWithPlaceholder()
          ? _value.contact1Name
          // ignore: cast_nullable_to_non_nullable
          : contact1Name as String?,
      contact1Number: contact1Number == const $CopyWithPlaceholder()
          ? _value.contact1Number
          // ignore: cast_nullable_to_non_nullable
          : contact1Number as String?,
      contact1Relation: contact1Relation == const $CopyWithPlaceholder()
          ? _value.contact1Relation
          // ignore: cast_nullable_to_non_nullable
          : contact1Relation as String?,
      contact2Name: contact2Name == const $CopyWithPlaceholder()
          ? _value.contact2Name
          // ignore: cast_nullable_to_non_nullable
          : contact2Name as String?,
      contact2Number: contact2Number == const $CopyWithPlaceholder()
          ? _value.contact2Number
          // ignore: cast_nullable_to_non_nullable
          : contact2Number as String?,
      contact2Relation: contact2Relation == const $CopyWithPlaceholder()
          ? _value.contact2Relation
          // ignore: cast_nullable_to_non_nullable
          : contact2Relation as String?,
    );
  }
}

extension $PatientOnboardingStateCopyWith on PatientOnboardingState {
  /// Returns a callable class that can be used as follows: `instanceOfPatientOnboardingState.copyWith(...)` or like so:`instanceOfPatientOnboardingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PatientOnboardingStateCWProxy get copyWith =>
      _$PatientOnboardingStateCWProxyImpl(this);
}

abstract class _$CaregiverOnboardingCWProxy {
  CaregiverOnboarding name(String? name);

  CaregiverOnboarding emailId(String? emailId);

  CaregiverOnboarding phone(String? phone);

  CaregiverOnboarding profilePicture(PlatformFile? profilePicture);

  CaregiverOnboarding patientEmails(List<String>? patientEmails);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaregiverOnboarding(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaregiverOnboarding(...).copyWith(id: 12, name: "My name")
  /// ````
  CaregiverOnboarding call({
    String? name,
    String? emailId,
    String? phone,
    PlatformFile? profilePicture,
    List<String>? patientEmails,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCaregiverOnboarding.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCaregiverOnboarding.copyWith.fieldName(...)`
class _$CaregiverOnboardingCWProxyImpl implements _$CaregiverOnboardingCWProxy {
  const _$CaregiverOnboardingCWProxyImpl(this._value);

  final CaregiverOnboarding _value;

  @override
  CaregiverOnboarding name(String? name) => this(name: name);

  @override
  CaregiverOnboarding emailId(String? emailId) => this(emailId: emailId);

  @override
  CaregiverOnboarding phone(String? phone) => this(phone: phone);

  @override
  CaregiverOnboarding profilePicture(PlatformFile? profilePicture) =>
      this(profilePicture: profilePicture);

  @override
  CaregiverOnboarding patientEmails(List<String>? patientEmails) =>
      this(patientEmails: patientEmails);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaregiverOnboarding(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaregiverOnboarding(...).copyWith(id: 12, name: "My name")
  /// ````
  CaregiverOnboarding call({
    Object? name = const $CopyWithPlaceholder(),
    Object? emailId = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? profilePicture = const $CopyWithPlaceholder(),
    Object? patientEmails = const $CopyWithPlaceholder(),
  }) {
    return CaregiverOnboarding(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      emailId: emailId == const $CopyWithPlaceholder()
          ? _value.emailId
          // ignore: cast_nullable_to_non_nullable
          : emailId as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      profilePicture: profilePicture == const $CopyWithPlaceholder()
          ? _value.profilePicture
          // ignore: cast_nullable_to_non_nullable
          : profilePicture as PlatformFile?,
      patientEmails: patientEmails == const $CopyWithPlaceholder()
          ? _value.patientEmails
          // ignore: cast_nullable_to_non_nullable
          : patientEmails as List<String>?,
    );
  }
}

extension $CaregiverOnboardingCopyWith on CaregiverOnboarding {
  /// Returns a callable class that can be used as follows: `instanceOfCaregiverOnboarding.copyWith(...)` or like so:`instanceOfCaregiverOnboarding.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CaregiverOnboardingCWProxy get copyWith =>
      _$CaregiverOnboardingCWProxyImpl(this);
}
