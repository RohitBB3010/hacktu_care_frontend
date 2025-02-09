import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hacktu_care_frontend/components/custom_button.dart';
import 'package:hacktu_care_frontend/components/custom_textfield.dart';
import 'package:hacktu_care_frontend/components/snackbar.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/constants/spacing_consts.dart';
import 'package:hacktu_care_frontend/constants/string_consts.dart';
import 'package:hacktu_care_frontend/constants/text_styles.dart';
import 'package:hacktu_care_frontend/home/prescriptions/add_prescription/add_prescriptions_cubit.dart';
import 'package:hacktu_care_frontend/home/prescriptions/add_prescription/add_prescriptions_state.dart';
import 'package:hacktu_care_frontend/shared/models.dart';
import 'package:hacktu_care_frontend/shared/prescriptions.dart';
import 'package:intl/intl.dart';

class AddPrescriptionPage extends StatelessWidget {
  AddPrescriptionPage({super.key, required this.patients});
  List<PatientData> patients;

  final List<String> doctorSpecialties = [
    "General Practitioner (Manages overall health)",
    "Cardiologist (Heart specialist)",
    "Neurologist (Brain and nervous system specialist)",
    "Endocrinologist (Hormonal disorders specialist)",
    "Orthopedic Surgeon (Bone and joint specialist)",
    "Dermatologist (Skin, hair, and nail specialist)",
    "Gynecologist (Female reproductive health specialist)",
    "Psychiatrist (Mental health specialist)",
    "Pulmonologist (Lung and respiratory specialist)",
    "Oncologist (Cancer specialist)",
    "Others"
  ];

  String formatDate(DateTime? date) {
    if (date == null) return PrescriptionStrings().selectDateOfVisit;
    // Get the day of the month
    int day = date.day;

    // Determine the ordinal suffix
    String suffix = 'th';
    if (day % 10 == 1 && day % 100 != 11) {
      suffix = 'st';
    } else if (day % 10 == 2 && day % 100 != 12) {
      suffix = 'nd';
    } else if (day % 10 == 3 && day % 100 != 13) {
      suffix = 'rd';
    }

    // Format the date
    String formattedDate =
        '${DateFormat("d").format(date)}$suffix ${DateFormat("MMM yyyy").format(date)}';
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConsts().primary,
        centerTitle: true,
        title: AutoSizeText(
          PrescriptionStrings().addPrescription,
          style: CustomTextStyles().regular(fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                FontAwesomeIcons.xmark,
                size: 30,
              ))
        ],
      ),
      body: BlocBuilder<AddPrescriptionsCubit, AddPrescriptionsState>(
        builder: (context, state) {
          final addPrescriptionsCubit = context.read<AddPrescriptionsCubit>();
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacingConsts().smallHeightBetweenFields(context),
                  CustomTextField(
                      fieldWidth: 0.8,
                      fieldHeight: 0.06,
                      hintText: PrescriptionStrings().addDisease,
                      onChanged: addPrescriptionsCubit.diseaseChanged),
                  SpacingConsts().smallHeightBetweenFields(context),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Scrollbar(
                      child: TextFormField(
                        onChanged: addPrescriptionsCubit.descriptionChanged,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          fillColor: ColorConsts().textField,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Set border radius to 15
                              borderSide: BorderSide.none),
                          hintText: PrescriptionStrings().addDescription,
                          hintStyle: TextStyle(
                              color: ColorConsts().textFieldText,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  CustomTextField(
                      fieldWidth: 0.8,
                      fieldHeight: 0.06,
                      hintText: PrescriptionStrings().addDoctorName,
                      onChanged: addPrescriptionsCubit.doctorNameChanged),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConsts().textField),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          formatDate(state.visitDate),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: ColorConsts().textFieldText),
                        ),
                        IconButton(
                            onPressed: () async {
                              DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now()
                                      .subtract(const Duration(days: 360)),
                                  lastDate: DateTime.now());

                              if (selectedDate != null) {
                                addPrescriptionsCubit
                                    .visitDateChanged(selectedDate);
                              }
                            },
                            icon: const Icon(FontAwesomeIcons.calendarDay))
                      ],
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConsts().textField),
                    child: DropdownMenuTheme(
                      data: DropdownMenuThemeData(
                          menuStyle: MenuStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConsts().accent))),
                      child: DropdownButton(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          isExpanded: true,
                          hint: AutoSizeText(PrescriptionStrings().selectTag,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: ColorConsts().textFieldText)),
                          value: state.tag,
                          underline: Container(),
                          items: doctorSpecialties.map((specialty) {
                            return DropdownMenuItem(
                              value: specialty,
                              child: AutoSizeText(
                                specialty,
                                style: CustomTextStyles().regular(),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            addPrescriptionsCubit.tagChanged(value!);
                          }),
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConsts().textField),
                    child: DropdownMenuTheme(
                      data: DropdownMenuThemeData(
                          menuStyle: MenuStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConsts().accent))),
                      child: DropdownButton(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          isExpanded: true,
                          hint: AutoSizeText("Select the patient",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: ColorConsts().textFieldText)),
                          value: state.selectedPatient,
                          underline: Container(),
                          items: patients.map((patient) {
                            return DropdownMenuItem(
                              value: patient,
                              child: AutoSizeText(
                                patient.name,
                                style: CustomTextStyles().regular(),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            addPrescriptionsCubit
                                .selectedPatientChanged(value as PatientData);
                          }),
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(PrescriptionStrings().doctorsPrescription,
                          style: CustomTextStyles().regular()),
                      SpacingConsts().customHeightBetweenFields(context, 0.01),
                      if (state.prescription == null)
                        GestureDetector(
                          onTap: () async {
                            final result = await FilePicker.platform.pickFiles(
                              allowedExtensions: ['pdf'],
                              withData: true,
                              type: FileType.custom,
                              allowMultiple: false,
                            );

                            if (result != null) {
                              addPrescriptionsCubit
                                  .prescriptionChanged(result.files.single);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                                color: ColorConsts().accent,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Icon(
                              Icons.upload_file,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      if (state.prescription != null)
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          decoration: BoxDecoration(
                              color: ColorConsts().textField,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: AutoSizeText(
                                    state.prescription!.path!.split('/').last,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: ColorConsts().textFieldText,
                                        overflow: TextOverflow.ellipsis),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    addPrescriptionsCubit
                                        .prescriptionChanged(null);
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.xmark,
                                    color: Colors.red,
                                  )),
                              SpacingConsts().smallHeightBetweenFields(context),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SpacingConsts().mediumHeightBetweenFields(context),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          PrescriptionStrings().addSupportingDocuments,
                          style: CustomTextStyles().regular(),
                        ),
                        SpacingConsts()
                            .customHeightBetweenFields(context, 0.01),
                        if (state.supportingDocuments != null)
                          Wrap(
                            runSpacing:
                                MediaQuery.of(context).size.height * 0.01,
                            children: state.supportingDocuments!.map((doc) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                decoration: BoxDecoration(
                                    color: ColorConsts().textField,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: AutoSizeText(
                                          doc.path!.split('/').last,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color:
                                                  ColorConsts().textFieldText,
                                              overflow: TextOverflow.ellipsis),
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          addPrescriptionsCubit
                                              .removeSupportingDoc(doc);
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.xmark,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        if (state.supportingDocuments != null)
                          SpacingConsts()
                              .customHeightBetweenFields(context, 0.02),
                        GestureDetector(
                          onTap: () async {
                            final result = await FilePicker.platform.pickFiles(
                              allowedExtensions: ['pdf'],
                              withData: true,
                              type: FileType.custom,
                              allowMultiple: false,
                            );
                            if (result != null) {
                              addPrescriptionsCubit.supportingDocumentsChanged(
                                  result.files.first);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                                color: ColorConsts().accent,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Icon(
                              Icons.upload_file,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  CustomButton(context, PrescriptionStrings().addPrescription,
                      ColorConsts().accent, () async {
                    if (state.disease == null ||
                        state.disease!.isEmpty ||
                        state.visitDate == null ||
                        state.tag == null ||
                        state.prescription == null) {
                      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                          SnackbarTexts().plsFillAllFields, null));
                    } else {
                      debugPrint("here");

                      Prescriptions? addedPrescription =
                          await addPrescriptionsCubit.addPrescriptions(
                              state.disease!,
                              state.description,
                              state.doctorName,
                              state.visitDate!,
                              state.tag!,
                              state.selectedPatient!,
                              state.prescription!,
                              state.supportingDocuments);

                      if (addedPrescription == null) {
                        ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                            "Some unexpected error occured, please try again later in sometime",
                            null));
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context, addedPrescription);
                      }
                    }
                  }, 0.8, 0.06, null),
                  SpacingConsts().mediumHeightBetweenFields(context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
