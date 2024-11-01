import 'package:flutter/material.dart';

class OmniHoverZoomIn extends StatefulWidget {
  final Duration? duration;
  final double? zoom;
  final Widget? child;
  final bool? isHovered;
  const OmniHoverZoomIn(
      {super.key, this.zoom, this.child, this.duration, this.isHovered});

  @override
  State<OmniHoverZoomIn> createState() => _OmniHoverZoomInState();
}

class _OmniHoverZoomInState extends State<OmniHoverZoomIn> {
  var isHovered = false;

  @override
  void initState() {
    isHovered = widget.isHovered ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration ?? const Duration(milliseconds: 300),
      transform: Matrix4.identity()..scale(isHovered ? widget.zoom ?? 1.02 : 1),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: MouseRegion(
        child: widget.child,
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (event) => setState(() => isHovered = false),
      ),
    );
  }
}
