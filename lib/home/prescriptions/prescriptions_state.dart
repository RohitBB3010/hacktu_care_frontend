import 'package:hacktu_care_frontend/shared/prescriptions.dart';

class PrescriptionsState {}

class PrescriptionsLoadingState extends PrescriptionsState {}

class PrescriptionsLoadedState extends PrescriptionsState {
  List<Prescriptions> prescriptions;
  String? diseaseSearchTitle;
  DateTime? searchStartDate;
  DateTime? searchEndDate;
  String? searchTag;

  PrescriptionsLoadedState(
      {required this.prescriptions,
      this.diseaseSearchTitle,
      this.searchStartDate,
      this.searchEndDate,
      this.searchTag});
}
