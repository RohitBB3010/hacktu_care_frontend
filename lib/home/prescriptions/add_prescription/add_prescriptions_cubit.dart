import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hacktu_care_frontend/home/prescriptions/add_prescription/add_prescriptions_state.dart';
import 'package:hacktu_care_frontend/shared/models.dart';
import 'package:hacktu_care_frontend/shared/prescriptions.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AddPrescriptionsCubit extends Cubit<AddPrescriptionsState> {
  AddPrescriptionsCubit() : super(AddPrescriptionsState());

  Future<Prescriptions?> addPrescriptions(
      String diease,
      String? description,
      String? doctorName,
      DateTime dateOfVisit,
      String tag,
      PatientData patientData,
      PlatformFile prescription,
      List<PlatformFile>? supportingDocs) async {
    try {
      debugPrint("Calling API");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');
      debugPrint(token);

      String addPrescriptionUri =
          '${dotenv.env['TEST_BASE_URI']}/prescriptions/add-prescription';

      final storageRef = FirebaseStorage.instance.ref();
      final prescriptionFileName = prescription.path!.split('/').last;
      final storagePath = 'prescriptions/$prescriptionFileName';

      final uploadTask =
          await storageRef.child(storagePath).putFile(File(prescription.path!));

      String downloadUrl = await uploadTask.ref.getDownloadURL();

      debugPrint("url is $downloadUrl");

      Map<String, dynamic> requestBody = {
        'disease': diease,
        'description': description,
        'branch': tag,
        'date_of_visit': dateOfVisit.toIso8601String(),
        'patientId': patientData.id,
        'doctor_name': doctorName,
        'prescription': downloadUrl
      };

      if (supportingDocs != null && supportingDocs.isNotEmpty) {
        List<String> supportingDocsUrl = [];
        String storagePath = 'supporting_docs/';

        for (var doc in supportingDocs) {
          final docName = doc.path!.split('/').last;
          final uploadTask = await storageRef
              .child('$storagePath/$docName')
              .putFile(File(doc.path!));

          String downloadUrl = await uploadTask.ref.getDownloadURL();
          supportingDocsUrl.add(downloadUrl);
        }

        requestBody['supporting_documents'] = supportingDocsUrl;
      }

      final response = await http.post(Uri.parse(addPrescriptionUri),
          body: json.encode(requestBody),
          headers: {
            'Content-Type': 'application/json',
            'authorization': 'Bearer $token'
          });

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 500 ||
          response.statusCode == 400 ||
          response.statusCode == 401) {
        return null;
      } else {
        final responseBody = json.decode(response.body);
        Prescriptions pres =
            Prescriptions.fromJson(responseBody['prescription']);
        debugPrint(pres.toString());
        return pres;
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void diseaseChanged(String value) {
    emit((state).copyWith(disease: value));
  }

  void descriptionChanged(String value) {
    emit((state).copyWith(description: value));
  }

  void tagChanged(String value) {
    emit((state).copyWith(tag: value));
  }

  void doctorNameChanged(String value) {
    emit((state).copyWith(doctorName: value));
  }

  void prescriptionChanged(PlatformFile? value) {
    emit((state).copyWith(prescription: value));
  }

  void selectedPatientChanged(PatientData patient) {
    emit((state).copyWith(selectedPatient: patient));
  }

  void visitDateChanged(DateTime value) {
    emit((state).copyWith(visitDate: value));
  }

  void supportingDocumentsChanged(PlatformFile value) {
    List<PlatformFile> updatedDocs = [];
    if ((state).supportingDocuments != null) {
      updatedDocs = [...(state).supportingDocuments!, value];
    } else {
      updatedDocs = [value];
    }
    emit(state.copyWith(supportingDocuments: updatedDocs));
  }

  void removeSupportingDoc(PlatformFile value) {
    List<PlatformFile> updatedDocs = state.supportingDocuments!;
    updatedDocs.removeWhere((doc) => doc.path! == value.path!);

    emit((state).copyWith(supportingDocuments: updatedDocs));
  }
}
