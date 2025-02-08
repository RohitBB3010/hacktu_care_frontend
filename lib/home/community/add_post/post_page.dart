import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/components/custom_button.dart';
import 'package:hacktu_care_frontend/components/custom_textfield.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/constants/spacing_consts.dart';
import 'package:hacktu_care_frontend/constants/text_styles.dart';
import 'package:hacktu_care_frontend/home/community/add_post/post_cubit.dart';
import 'package:hacktu_care_frontend/home/community/add_post/post_state.dart';

class AddPostPage extends StatelessWidget {
  AddPostPage({super.key});

  List<String> tags = ["Advice", "Tips", "Rant", "Exhausted", "Random"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: BlocBuilder<PostCubit, AddPostState>(builder: (context, state) {
        final addPostCubit = context.read<PostCubit>();
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const AutoSizeText("Add post page"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel))
            ],
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacingConsts().mediumHeightBetweenFields(context),
                CustomTextField(
                    fieldWidth: 0.8,
                    hintText: "Add post title",
                    fieldHeight: 0.06,
                    onChanged: addPostCubit.titleChanged),
                SpacingConsts().smallHeightBetweenFields(context),
                CustomTextField(
                    fieldWidth: 0.8,
                    fieldHeight: 0.06,
                    hintText: "Add post description",
                    onChanged: addPostCubit.postBodyChanged),
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
                        hint: AutoSizeText("Select tag",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: ColorConsts().textFieldText)),
                        value: state.tag,
                        underline: Container(),
                        items: tags.map((specialty) {
                          return DropdownMenuItem(
                            value: specialty,
                            child: AutoSizeText(
                              specialty,
                              style: CustomTextStyles().regular(),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          addPostCubit.tagChanged(value!);
                        }),
                  ),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                if (state.postImage == null)
                  AutoSizeText("Add profile picture",
                      style: CustomTextStyles().regular()),
                if (state.postImage == null)
                  CustomButton(context, "Add Image", ColorConsts().accent,
                      () async {
                    final result = await FilePicker.platform.pickFiles(
                        withData: true,
                        allowedExtensions: ['jpg', 'png'],
                        type: FileType.custom);

                    if (result != null) {
                      addPostCubit.postImageChanged(result.files.single);
                    }
                  }, 0.8, 0.03, 20),
                if (state.postImage != null)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(state.postImage!.path!)),
                            fit: BoxFit.cover)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              addPostCubit.postImageChanged(null);
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                SpacingConsts().smallHeightBetweenFields(context),
                CustomButton(context, "Add Post", ColorConsts().secondary,
                    () async {
                  addPostCubit.addPost(
                      state.title!, state.postBody!, state.tag!, null);
                }, null, null, 10)
              ],
            ),
          ),
        );
      }),
    );
  }
}
