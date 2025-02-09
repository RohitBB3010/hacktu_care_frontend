import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/components/custom_button.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/constants/spacing_consts.dart';
import 'package:hacktu_care_frontend/constants/string_consts.dart';
import 'package:hacktu_care_frontend/constants/text_styles.dart';
import 'package:hacktu_care_frontend/home/prescriptions/add_prescription/add_prescription_page.dart';
import 'package:hacktu_care_frontend/home/prescriptions/add_prescription/add_prescriptions_cubit.dart';
import 'package:hacktu_care_frontend/home/prescriptions/prescriptions_cubit.dart';
import 'package:hacktu_care_frontend/shared/models.dart';

// class PrescriptionsPage extends StatelessWidget {
//   PrescriptionsPage({super.key, required this.patients});
//   List<PatientData> patients;

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
//                           child: AddPrescriptionPage(patients: patients));
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

class PrescriptionsPage extends StatefulWidget {
  PrescriptionsPage({super.key, required this.patients});
  List<PatientData> patients;

  @override
  State<PrescriptionsPage> createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PrescriptionsCubit>().getPrescriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingConsts().customHeightBetweenFields(context, 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    PrescriptionStrings().prescriptionPageTitle,
                    style: CustomTextStyles().heading(fontSize: 25),
                  ),
                  CustomButton(context, PrescriptionStrings().addNew,
                      ColorConsts().accent, () async {
                    final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BlocProvider(
                          create: (context) => AddPrescriptionsCubit(),
                          child:
                              AddPrescriptionPage(patients: widget.patients));
                    }));
                  }, 0.25, 0.04, 5)
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
