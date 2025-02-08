import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/auth/auth_cubit.dart';
import 'package:hacktu_care_frontend/auth/auth_state.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/constants/spacing_consts.dart';
import 'package:hacktu_care_frontend/constants/string_consts.dart';
import 'package:hacktu_care_frontend/constants/text_styles.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthInitalState) {
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacingConsts().customHeightBetweenFields(context, 0.15),
                  AutoSizeText(NameStrings().name,
                      style: CustomTextStyles().heading()),
                  AutoSizeText(NameStrings().motto,
                      style: CustomTextStyles().regular()),
                  SpacingConsts().mediumHeightBetweenFields(context),
                  GestureDetector(
                    onTap: () async {
                      context.read<AuthCubit>().initialRoleSelect('Caregiver');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConsts().textField),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                child: Image(
                                    image: AssetImage(
                                        'assets/placeholders/profile.png')),
                              ),
                              SpacingConsts().smallWidthBetweenFields(context),
                              AutoSizeText(
                                "Caregiver",
                                style: CustomTextStyles().regular(),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.3,
                          color: ColorConsts().secondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("or",
                            style: TextStyle(color: ColorConsts().secondary)),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Divider(
                            thickness: 0.3,
                            color: ColorConsts().secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  GestureDetector(
                    onTap: () async {
                      context.read<AuthCubit>().initialRoleSelect('patient');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConsts().textField),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                child: Image(
                                    image: AssetImage(
                                        'assets/placeholders/profile.png')),
                              ),
                              SpacingConsts().smallWidthBetweenFields(context),
                              AutoSizeText(
                                "Patient",
                                style: CustomTextStyles().regular(),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const AutoSizeText('Error on initialpage');
      },
    );
  }
}
