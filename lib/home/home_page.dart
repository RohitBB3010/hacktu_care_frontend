import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hacktu_care_frontend/auth/auth_cubit.dart';
import 'package:hacktu_care_frontend/auth/auth_state.dart';
import 'package:hacktu_care_frontend/components/custom_button.dart';
import 'package:hacktu_care_frontend/components/loading_page.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/constants/spacing_consts.dart';
import 'package:hacktu_care_frontend/constants/text_styles.dart';
import 'package:hacktu_care_frontend/home/chatbot/chat_cubit.dart';
import 'package:hacktu_care_frontend/home/chatbot/chat_screen.dart';
import 'package:hacktu_care_frontend/home/community/community_cubit.dart';
import 'package:hacktu_care_frontend/home/community/community_page.dart';
import 'package:hacktu_care_frontend/home/prescriptions/prescriptions_cubit.dart';
import 'package:hacktu_care_frontend/home/prescriptions/prescriptions_page.dart';
import 'package:hacktu_care_frontend/home/profile/profile_page.dart';
import 'package:hacktu_care_frontend/shared/models.dart';
import 'package:hacktu_care_frontend/shared/prescriptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  bool isLoading = true;
  String? userName;
  String? userPfp;
  List<dynamic> patientData = [];
  final PageController _controller = PageController(initialPage: 0);

  List<Widget> pages = [
    PrescriptionsPage(),
    ChatScreen(),
    CommunityPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    getBasicData();
  }

  Future<String?> getBasicData() async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');

    debugPrint("Auth token is : $authToken");
    String getCareGiverDataAPI =
        '${dotenv.env['TEST_BASE_URI']}/caregiver/get-caregiver-data';

    final response = await http.get(Uri.parse(getCareGiverDataAPI), headers: {
      'Content-type': 'application/json',
      'authorization': 'bearer $authToken'
    });

    final decodedResponse = json.decode(response.body);

    debugPrint(decodedResponse.toString());
    setState(() {
      userName = decodedResponse['data']['caregiverData']['name'].toString();
      isLoading = false;
      patientData = decodedResponse['data']['patientData'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingPage();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConsts().primary,
          surfaceTintColor: ColorConsts().primary,
          title: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/placeholders/profile.png'),
              ),
              SpacingConsts().smallWidthBetweenFields(context),
              AutoSizeText(
                userName!,
                style: CustomTextStyles().regular(fontSize: 25),
              )
            ],
          ),
          actions: [
            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              return CustomButton(context, "Signout", Colors.red, () {
                context.read<AuthCubit>().logoutUser();
              }, 0.2, 0.03, 10);
            }),
          ],
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.005,
          ),
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.width * 0.02,
              top: 0),
          decoration: BoxDecoration(
              color: ColorConsts().accent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: ColorConsts().secondary.withOpacity(0.4),
                    offset: const Offset(0, 20),
                    spreadRadius: 10,
                    blurRadius: 25)
              ]),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildIcon(currentPage, FontAwesomeIcons.prescription, 0),
                buildIcon(currentPage, FontAwesomeIcons.comment, 1),
                buildIcon(currentPage, FontAwesomeIcons.pills, 2),
                buildIcon(currentPage, FontAwesomeIcons.user, 3)
              ],
            ),
          ),
        ),
        body: PageView(
          controller: _controller,
          children: [
            const PrescriptionsPage(),
            BlocProvider(
                create: (context) => ChatCubit()..fetchInitialData(patientData),
                child: ChatScreen(patientData: patientData)),
            BlocProvider(
              create: (context) => CommunityCubit()..fetchPosts(),
              child: CommunityPage(),
            ),
            const ProfilePage()
          ],
        ));
  }

  Widget buildIcon(int selectedIndex, IconData icon, int iconIndex) {
    return GestureDetector(
        onTap: () {
          setState(() {
            currentPage = iconIndex;
            _controller.jumpToPage(iconIndex);
          });
        },
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: ColorConsts().primary, size: 25),
          if (iconIndex == selectedIndex)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.07,
              child: Divider(
                height: MediaQuery.of(context).size.height * 0.01,
                color: ColorConsts().primary,
              ),
            )
        ]));
  }
}
