import 'package:flutter/material.dart';

extension GestureDetectorExtension on Widget {
  Widget withCursor({MouseCursor cursor = SystemMouseCursors.click}) {
    return MouseRegion(
      cursor: cursor,
      child: this,
    );
  }
}
