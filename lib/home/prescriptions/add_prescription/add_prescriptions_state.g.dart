// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_prescriptions_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddPrescriptionsStateCWProxy {
  AddPrescriptionsState disease(String? disease);

  AddPrescriptionsState description(String? description);

  AddPrescriptionsState tag(String? tag);

  AddPrescriptionsState doctorName(String? doctorName);

  AddPrescriptionsState selectedPatient(PatientData? selectedPatient);

  AddPrescriptionsState prescription(PlatformFile? prescription);

  AddPrescriptionsState visitDate(DateTime? visitDate);

  AddPrescriptionsState supportingDocuments(
      List<PlatformFile>? supportingDocuments);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddPrescriptionsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddPrescriptionsState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddPrescriptionsState call({
    String? disease,
    String? description,
    String? tag,
    String? doctorName,
    PatientData? selectedPatient,
    PlatformFile? prescription,
    DateTime? visitDate,
    List<PlatformFile>? supportingDocuments,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddPrescriptionsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddPrescriptionsState.copyWith.fieldName(...)`
class _$AddPrescriptionsStateCWProxyImpl
    implements _$AddPrescriptionsStateCWProxy {
  const _$AddPrescriptionsStateCWProxyImpl(this._value);

  final AddPrescriptionsState _value;

  @override
  AddPrescriptionsState disease(String? disease) => this(disease: disease);

  @override
  AddPrescriptionsState description(String? description) =>
      this(description: description);

  @override
  AddPrescriptionsState tag(String? tag) => this(tag: tag);

  @override
  AddPrescriptionsState doctorName(String? doctorName) =>
      this(doctorName: doctorName);

  @override
  AddPrescriptionsState selectedPatient(PatientData? selectedPatient) =>
      this(selectedPatient: selectedPatient);

  @override
  AddPrescriptionsState prescription(PlatformFile? prescription) =>
      this(prescription: prescription);

  @override
  AddPrescriptionsState visitDate(DateTime? visitDate) =>
      this(visitDate: visitDate);

  @override
  AddPrescriptionsState supportingDocuments(
          List<PlatformFile>? supportingDocuments) =>
      this(supportingDocuments: supportingDocuments);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddPrescriptionsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddPrescriptionsState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddPrescriptionsState call({
    Object? disease = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? tag = const $CopyWithPlaceholder(),
    Object? doctorName = const $CopyWithPlaceholder(),
    Object? selectedPatient = const $CopyWithPlaceholder(),
    Object? prescription = const $CopyWithPlaceholder(),
    Object? visitDate = const $CopyWithPlaceholder(),
    Object? supportingDocuments = const $CopyWithPlaceholder(),
  }) {
    return AddPrescriptionsState(
      disease: disease == const $CopyWithPlaceholder()
          ? _value.disease
          // ignore: cast_nullable_to_non_nullable
          : disease as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      tag: tag == const $CopyWithPlaceholder()
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as String?,
      doctorName: doctorName == const $CopyWithPlaceholder()
          ? _value.doctorName
          // ignore: cast_nullable_to_non_nullable
          : doctorName as String?,
      selectedPatient: selectedPatient == const $CopyWithPlaceholder()
          ? _value.selectedPatient
          // ignore: cast_nullable_to_non_nullable
          : selectedPatient as PatientData?,
      prescription: prescription == const $CopyWithPlaceholder()
          ? _value.prescription
          // ignore: cast_nullable_to_non_nullable
          : prescription as PlatformFile?,
      visitDate: visitDate == const $CopyWithPlaceholder()
          ? _value.visitDate
          // ignore: cast_nullable_to_non_nullable
          : visitDate as DateTime?,
      supportingDocuments: supportingDocuments == const $CopyWithPlaceholder()
          ? _value.supportingDocuments
          // ignore: cast_nullable_to_non_nullable
          : supportingDocuments as List<PlatformFile>?,
    );
  }
}

extension $AddPrescriptionsStateCopyWith on AddPrescriptionsState {
  /// Returns a callable class that can be used as follows: `instanceOfAddPrescriptionsState.copyWith(...)` or like so:`instanceOfAddPrescriptionsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddPrescriptionsStateCWProxy get copyWith =>
      _$AddPrescriptionsStateCWProxyImpl(this);
}
