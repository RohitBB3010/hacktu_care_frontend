// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hacktu_care_frontend/components/custom_button.dart';
// import 'package:hacktu_care_frontend/constants/color_consts.dart';
// import 'package:hacktu_care_frontend/constants/spacing_consts.dart';
// import 'package:hacktu_care_frontend/constants/string_consts.dart';
// import 'package:hacktu_care_frontend/constants/text_styles.dart';
// import 'package:hacktu_care_frontend/home/prescriptions/add_prescription/add_prescription_page.dart';
// import 'package:hacktu_care_frontend/home/prescriptions/add_prescription/add_prescriptions_cubit.dart';
// import 'package:hacktu_care_frontend/home/prescriptions/prescriptions_cubit.dart';
// import 'package:hacktu_care_frontend/shared/models.dart';
// import 'package:hacktu_care_frontend/shared/prescriptions.dart';

// // class PrescriptionsPage extends StatelessWidget {
// //   PrescriptionsPage({super.key, required this.patients});
// //   List<PatientData> patients;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(
// //         horizontal: MediaQuery.of(context).size.width * 0.05,
// //       ),
// //       child: Builder(
// //         builder: (context) {
// //           return Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SpacingConsts().customHeightBetweenFields(context, 0.02),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   AutoSizeText(
// //                     PrescriptionStrings().prescriptionPageTitle,
// //                     style: CustomTextStyles().heading(fontSize: 25),
// //                   ),
// //                   CustomButton(context, PrescriptionStrings().addNew,
// //                       ColorConsts().accent, () async {
// //                     final result = await Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) {
// //                       return BlocProvider(
// //                           create: (context) => AddPrescriptionsCubit(),
// //                           child: AddPrescriptionPage(patients: patients));
// //                     }));
// //                   }, 0.25, 0.04, 5)
// //                 ],
// //               )
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// class PrescriptionsPage extends StatefulWidget {
//   PrescriptionsPage({super.key, required this.patients});
//   List<PatientData> patients;

//   @override
//   State<PrescriptionsPage> createState() => _PrescriptionsPageState();
// }

// class _PrescriptionsPageState extends State<PrescriptionsPage> {
//   final List<Prescriptions> dummyPrescriptions = [
//     Prescriptions(
//       disease: "Diabetes",
//       description: "Regular checkup for diabetes management.",
//       branch: "Endocrinology",
//       prescriptionUrl: "https://example.com/prescription1.pdf",
//       doctorName: "Dr. John Doe",
//       dateOfVisit: DateTime(2024, 1, 15),
//       supportingDocuments: [
//         "https://example.com/report1.pdf",
//         "https://example.com/lab_results1.pdf"
//       ],
//     ),
//     Prescriptions(
//       disease: "Hypertension",
//       description: "Consultation for high blood pressure.",
//       branch: "Cardiology",
//       prescriptionUrl: "https://example.com/prescription2.pdf",
//       doctorName: "Dr. Jane Smith",
//       dateOfVisit: DateTime(2024, 2, 10),
//       supportingDocuments: ["https://example.com/blood_test.pdf"],
//     ),
//     Prescriptions(
//       disease: "Migraine",
//       description: "Treatment plan for chronic migraine attacks.",
//       branch: "Neurology",
//       prescriptionUrl: "https://example.com/prescription3.pdf",
//       doctorName: "Dr. Emily Carter",
//       dateOfVisit: DateTime(2024, 3, 5),
//       supportingDocuments: [],
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     context.read<PrescriptionsCubit>().getPrescriptions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: MediaQuery.of(context).size.width * 0.05,
//       ),
//       child: Builder(
//         builder: (context) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SpacingConsts().customHeightBetweenFields(context, 0.02),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AutoSizeText(
//                     PrescriptionStrings().prescriptionPageTitle,
//                     style: CustomTextStyles().heading(fontSize: 25),
//                   ),
//                   CustomButton(context, PrescriptionStrings().addNew,
//                       ColorConsts().accent, () async {
//                     final result = await Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return BlocProvider(
//                           create: (context) => AddPrescriptionsCubit(),
//                           child:
//                               AddPrescriptionPage(patients: widget.patients));
//                     }));
//                   }, 0.25, 0.04, 5)
//                 ],
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hacktu_care_frontend/shared/prescriptions.dart';
import 'package:intl/intl.dart';

class PrescriptionsPage extends StatelessWidget {
  final List<Prescriptions> prescriptions = [
    Prescriptions(
      disease: "Diabetes",
      description: "Regular checkup for diabetes management.",
      branch: "Endocrinology",
      prescriptionUrl: "https://example.com/prescription1.pdf",
      doctorName: "Dr. John Doe",
      dateOfVisit: DateTime(2024, 1, 15),
      supportingDocuments: [
        "https://example.com/report1.pdf",
        "https://example.com/lab_results1.pdf"
      ],
    ),
    Prescriptions(
      disease: "Hypertension",
      description: "Consultation for high blood pressure.",
      branch: "Cardiology",
      prescriptionUrl: "https://example.com/prescription2.pdf",
      doctorName: "Dr. Jane Smith",
      dateOfVisit: DateTime(2024, 2, 10),
      supportingDocuments: ["https://example.com/blood_test.pdf"],
    ),
    Prescriptions(
      disease: "Migraine",
      description: "Treatment plan for chronic migraine attacks.",
      branch: "Neurology",
      prescriptionUrl: "https://example.com/prescription3.pdf",
      doctorName: "Dr. Emily Carter",
      dateOfVisit: DateTime(2024, 3, 5),
      supportingDocuments: [],
    ),
  ];

  PrescriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescriptions"),
        backgroundColor: const Color.fromARGB(255, 188, 215, 238),
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          final prescription = prescriptions[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prescription.disease,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text("Doctor: ${prescription.doctorName ?? "N/A"}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  Text("Branch: ${prescription.branch}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  Text(
                      "Date of Visit: ${DateFormat.yMMMd().format(prescription.dateOfVisit)}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Open the prescription URL (Assuming it opens in a browser)
                      print("Opening: ${prescription.prescriptionUrl}");
                    },
                    child: const Text("View Prescription"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
