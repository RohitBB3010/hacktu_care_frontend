import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hacktu_care_frontend/home/prescriptions/prescriptions_state.dart';
import 'package:hacktu_care_frontend/shared/prescriptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PrescriptionsCubit extends Cubit<PrescriptionsState> {
  PrescriptionsCubit() : super(PrescriptionsState());

  Future<void> getPrescriptions() async {
    debugPrint("Funtion called");

    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');

    String getPresUri =
        '${dotenv.env['TEST_BASE_URI']}/prescriptions/get-prescriptions';

    final response = await http.get(Uri.parse(getPresUri), headers: {
      'Content-type': 'application/json',
      'Authorization': 'bearer $authToken'
    });

    List<dynamic> prescriptions = [];

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      for (var item in decodedResponse['data']) {
        prescriptions = [...prescriptions, item['prescriptions']];
      }
    }

    List<Prescriptions> items = [];
    for (var item in prescriptions) {
      debugPrint(item);
      Prescriptions pres = Prescriptions.fromJson(item);
      items.add(pres);
    }

    debugPrint(items.toString());
  }

  void printStuff() {
    debugPrint("Rohit");
  }
}
