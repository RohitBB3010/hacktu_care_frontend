import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hacktu_care_frontend/shared/models.dart';

part 'add_prescriptions_state.g.dart';

@CopyWith()
class AddPrescriptionsState {
  String? disease;
  String? description;
  String? tag;
  String? doctorName;
  PatientData? selectedPatient;
  PlatformFile? prescription;
  DateTime? visitDate;
  List<PlatformFile>? supportingDocuments;

  AddPrescriptionsState(
      {this.disease,
      this.description,
      this.tag,
      this.doctorName,
      this.selectedPatient,
      this.prescription,
      this.visitDate,
      this.supportingDocuments});
}
