import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/components/loading_page.dart';
import 'package:hacktu_care_frontend/home/community/add_post/post_page.dart';
import 'package:hacktu_care_frontend/home/community/community_cubit.dart';
import 'package:hacktu_care_frontend/home/community/community_state.dart';

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
            body: SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
              child: Column(
                children: [],
              ),
            ),
          );
        }

        return const AutoSizeText("Last case");
      },
    );
  }
}
