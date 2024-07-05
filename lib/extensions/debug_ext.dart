import 'package:flutter/material.dart';

extension DebugExt on Widget {
  Widget debug({Color color = Colors.red}) {
    return Container(
      color: color,
      child: this,
    );
  }
}
