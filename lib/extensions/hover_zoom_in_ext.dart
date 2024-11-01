import 'package:flutter/material.dart';
import 'package:omni_flutter_utils/components/omni_hover_zoom_in.dart';

extension HoverZoomInExt on Widget {
  Widget hoverZoomIn({
    Duration? duration,
    double? zoom,
    bool? isHovered,
  }) {
    return OmniHoverZoomIn(
      duration: duration,
      zoom: zoom,
      isHovered: isHovered,
      child: this,
    );
  }
}
