import 'package:flutter/material.dart';
import 'package:omni_flutter_utils/util/omni_constants.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < OmniConstants.kMobileMaxWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= OmniConstants.kMobileMaxWidth &&
      MediaQuery.of(context).size.width < OmniConstants.kTabletMaxWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= OmniConstants.kTabletMaxWidth;
}
