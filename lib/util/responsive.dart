import 'package:flutter/material.dart';
import 'package:flutter_utils/constants.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < kMobileMaxWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= kMobileMaxWidth &&
      MediaQuery.of(context).size.width < kTabletMaxWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= kTabletMaxWidth;
}
