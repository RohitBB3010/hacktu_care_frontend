// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescriptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prescriptions _$PrescriptionsFromJson(Map<String, dynamic> json) =>
    Prescriptions(
      disease: json['disease'] as String,
      description: json['description'] as String?,
      branch: json['branch'] as String,
      prescriptionUrl: json['prescription'] as String,
      doctorName: json['doctor_name'] as String?,
      dateOfVisit: DateTime.parse(json['date_of_visit'] as String),
      supportingDocuments: (json['supportingDocuments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PrescriptionsToJson(Prescriptions instance) =>
    <String, dynamic>{
      'disease': instance.disease,
      'description': instance.description,
      'branch': instance.branch,
      'prescription': instance.prescriptionUrl,
      'doctor_name': instance.doctorName,
      'date_of_visit': instance.dateOfVisit.toIso8601String(),
      'supportingDocuments': instance.supportingDocuments,
    };
