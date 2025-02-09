import 'package:json_annotation/json_annotation.dart';

part 'prescriptions.g.dart';

@JsonSerializable()
class Prescriptions {
  String disease;
  String? description;
  String branch;
  @JsonKey(name: 'prescription')
  String prescriptionUrl;
  @JsonKey(name: 'doctor_name')
  String? doctorName;
  @JsonKey(name: 'date_of_visit')
  DateTime dateOfVisit;
  List<String>? supportingDocuments;

  factory Prescriptions.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionsFromJson(json);

  Prescriptions(
      {required this.disease,
      this.description,
      required this.branch,
      required this.prescriptionUrl,
      this.doctorName,
      required this.dateOfVisit,
      this.supportingDocuments});

  Map<String, dynamic> toJson() => _$PrescriptionsToJson(this);
}
