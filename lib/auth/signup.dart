import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/auth/auth_cubit.dart';
import 'package:hacktu_care_frontend/auth/auth_state.dart';
import 'package:hacktu_care_frontend/components/custom_button.dart';
import 'package:hacktu_care_frontend/components/custom_textfield.dart';
import 'package:hacktu_care_frontend/components/snackbar.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/constants/spacing_consts.dart';
import 'package:hacktu_care_frontend/constants/string_consts.dart';
import 'package:hacktu_care_frontend/constants/text_styles.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();

        if (state is SignupState) {
          return SafeArea(
            child: Scaffold(
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpacingConsts().customHeightBetweenFields(context, 0.15),
                      AutoSizeText(NameStrings().name,
                          style: CustomTextStyles().heading()),
                      AutoSizeText(NameStrings().motto,
                          style: CustomTextStyles().regular()),
                      SpacingConsts().mediumHeightBetweenFields(context),
                      if (state.errorMessage != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                              SpacingConsts().smallWidthBetweenFields(context),
                              AutoSizeText(state.errorMessage!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins')),
                            ],
                          ),
                        ),
                      SpacingConsts().smallHeightBetweenFields(context),
                      CustomTextField(
                          fieldWidth: 0.8,
                          fieldHeight: 0.06,
                          hintText: AuthStrings().enterEmail,
                          prefixIconData: Icons.email_outlined,
                          onChanged: authCubit.signupEmailChanged),
                      SpacingConsts().smallHeightBetweenFields(context),
                      CustomTextField(
                          fieldWidth: 0.8,
                          fieldHeight: 0.06,
                          hintText: AuthStrings().enterPassword,
                          prefixIconData: Icons.password_outlined,
                          onChanged: authCubit.signupPasswordChanged),
                      SpacingConsts().smallHeightBetweenFields(context),
                      CustomTextField(
                          fieldWidth: 0.8,
                          fieldHeight: 0.06,
                          hintText: AuthStrings().enterConfirmPassword,
                          prefixIconData: Icons.password_outlined,
                          onChanged: authCubit.signupConfirmPasswordChanged),
                      SpacingConsts().mediumHeightBetweenFields(context),
                      CustomButton(context, AuthStrings().signup, null,
                          () async {
                        if (state.email == null ||
                            state.email!.isEmpty ||
                            state.password == null ||
                            state.password!.isEmpty ||
                            state.confirmPassword == null ||
                            state.confirmPassword!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackbar(
                                  SnackbarTexts().plsFillAllFields, null));
                        } else {}
                      }, null, null, null),
                      SpacingConsts().smallHeightBetweenFields(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: authCubit.emitSigninState,
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              child: AutoSizeText(
                                AuthStrings().accountAlreadyExists,
                                style: TextStyle(
                                    color: ColorConsts().accent,
                                    fontSize: 15,
                                    fontFamily: 'Poppins'),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const AutoSizeText("last case");
        }
      },
    );
  }
}
