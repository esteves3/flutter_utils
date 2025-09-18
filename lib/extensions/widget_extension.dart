import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:omni_flutter_utils/components/omni_hover_zoom_in.dart';

extension WidgetExt on Widget {
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

  Future<(Uint8List, Size)> toImage({Size size = const Size.square(300)}) async {
    final repaintBoundary = RenderRepaintBoundary();
    final renderView = RenderView(
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        logicalConstraints: BoxConstraints.tight(size),
        devicePixelRatio: WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio,
      ),
      view: WidgetsBinding.instance.platformDispatcher.views.first,
    );

    final pipelineOwner = PipelineOwner()..rootNode = renderView;
    renderView.prepareInitialFrame();

    final buildOwner = BuildOwner(focusManager: WidgetsBinding.instance.focusManager);
    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntrinsicHeight(child: IntrinsicWidth(child: this)),
      ),
    ).attachToRenderTree(buildOwner);

    buildOwner
      ..buildScope(rootElement)
      ..finalizeTree();
    pipelineOwner
      ..flushLayout()
      ..flushCompositingBits()
      ..flushPaint();

    final image = await repaintBoundary.toImage(
        pixelRatio: WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    return (byteData!.buffer.asUint8List(), Size(image.width.toDouble(), image.height.toDouble()));
  }
}
