import 'package:flutter/material.dart';
import 'package:flutter_utils/components/hover_zoom_in.dart';

extension HoverZoomInExt on Widget {
  Widget hoverZoomIn({
    Duration? duration,
    double zoom = 1.1,
    bool? isHovered,
  }) {
    return HoverZoomIn(
      duration: duration,
      zoom: zoom,
      isHovered: isHovered,
      child: this,
    );
  }
}
