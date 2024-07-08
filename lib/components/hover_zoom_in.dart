import 'package:flutter/material.dart';

class HoverZoomIn extends StatefulWidget {
  final Duration? duration;
  final double zoom;
  final Widget? child;
  final bool? isHovered;
  const HoverZoomIn(
      {super.key, this.zoom = 1.1, this.child, this.duration, this.isHovered});

  @override
  State<HoverZoomIn> createState() => _HoverZoomInState();
}

class _HoverZoomInState extends State<HoverZoomIn> {
  var isHovered = false;

  @override
  void initState() {
    isHovered = widget.isHovered ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Actually rebuilding... $isHovered");
    return AnimatedContainer(
      duration: widget.duration ?? const Duration(milliseconds: 300),
      transform: Matrix4.identity()
        //..translate(widget.zoomOffset?.dx ?? 0.0, widget.zoomOffset?.dy ?? 0.0)
        ..scale(isHovered ? widget.zoom : 1),
      clipBehavior: Clip.hardEdge,
      child: MouseRegion(
        child: widget.child,
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (event) => setState(() => isHovered = false),
      ),
    );
  }
}