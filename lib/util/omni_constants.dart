import 'package:flutter/material.dart';

class OmniConstants {
  static const kDefaultBorderRadius = 24.0;
  static const defaultBorderRadius =
      BorderRadius.all(Radius.circular(kDefaultBorderRadius));
  static const kDefaultPadding = 14.0;
  static const defaultPadding = EdgeInsets.all(kDefaultPadding);

  static const kDefaultAnimationDuration = Duration(milliseconds: 300);
  static const kMobileMaxWidth = 850;
  static const kTabletMaxWidth = 1100;
}
