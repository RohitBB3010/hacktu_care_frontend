import 'package:flutter/material.dart';

class SpacingConsts {
  SizedBox smallHeightBetweenFields(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
    );
  }

  SizedBox mediumHeightBetweenFields(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }

  SizedBox largeHeightBetweenFields(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
    );
  }

  SizedBox customHeightBetweenFields(BuildContext context, double fieldHeight) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * fieldHeight,
    );
  }

  SizedBox smallWidthBetweenFields(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.01,
    );
  }

  SizedBox mediumWidthBetweenFields(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.03);
  }

  SizedBox largeWidthBetweenFields(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.05,
    );
  }

  SizedBox customWidthBetweenFields(BuildContext context, double fieldWidth) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
    );
  }
}
