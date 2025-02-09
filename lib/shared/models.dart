import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@CopyWith()
class Message {
  final String role;
  final String message;

  Message({required this.role, required this.message});
}

@JsonSerializable()
class PatientData {
  String name;
  @JsonKey(name: '_id')
  String id;

  factory PatientData.fromJson(Map<String, dynamic> json) =>
      _$PatientDataFromJson(json);

  PatientData({required this.name, required this.id});

  Map<String, dynamic> toJson() => _$PatientDataToJson(this);
}
