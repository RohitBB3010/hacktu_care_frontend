import 'package:flutter/material.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: LoadingIndicator(
          indicatorType: Indicator.ballScaleRipple,
          colors: [ColorConsts().accent],
        ),
      )),
    );
  }
}
