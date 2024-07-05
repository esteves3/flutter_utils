import 'package:flutter/material.dart';
import 'package:flutter_utils/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? borderRadius;
  final EdgeInsets? padding;
  const CustomCard(
      {super.key, this.child, this.color, this.borderRadius, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? const EdgeInsets.all(kDefaultPadding),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(borderRadius ?? kDefaultBorderRadius),
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 40,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: child);
  }
}
