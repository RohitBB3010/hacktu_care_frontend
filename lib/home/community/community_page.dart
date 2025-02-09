import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/components/loading_page.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/constants/text_styles.dart';
import 'package:hacktu_care_frontend/home/community/add_post/post_page.dart';
import 'package:hacktu_care_frontend/home/community/community_cubit.dart';
import 'package:hacktu_care_frontend/home/community/community_state.dart';
import 'package:hacktu_care_frontend/shared/post.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityState>(
      builder: (context, state) {
        if (state is CommunityLoadingState) {
          return const LoadingPage();
        }
        if (state is CommunityLoadedState) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddPostPage();
                }));
              },
              child: const Icon(Icons.add),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: state.posts.map((post) {
                    return buildPostContainer(context, post);
                  }).toList(),
                ),
              ),
            ),
          );
        }

        return const AutoSizeText("Last case");
      },
    );
  }

  Widget buildPostContainer(BuildContext context, Post post) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.005),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: ColorConsts().secondary.withOpacity(0.2),
            offset: const Offset(4, 5),
            spreadRadius: 2,
            blurRadius: 10)
      ], borderRadius: BorderRadius.circular(10), color: ColorConsts().primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: AutoSizeText(post.title,
                    maxLines: 1,
                    //style: CustomTextStyles().heading(fontSize: 18),
                    style: const TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        color: Color(0xff152238))),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                    vertical: MediaQuery.of(context).size.height * 0.005),
                decoration: BoxDecoration(
                    color: ColorConsts().accent,
                    borderRadius: BorderRadius.circular(20)),
                child: AutoSizeText(post.tag,
                    style: const TextStyle(
                        fontFamily: 'Poppins', color: Colors.white)),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          AutoSizeText(post.postBody,
              style: const TextStyle(fontFamily: 'Poppins')),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          AutoSizeText(
            "Written by : ${post.caregiverName} | ${post.postDate.substring(0, 10)}",
            style: CustomTextStyles().regular(fontSize: 10),
          )
        ],
      ),
    );
  }
}
