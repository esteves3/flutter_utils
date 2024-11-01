import 'package:flutter/material.dart';
import 'package:omni_flutter_utils/util/omni_constants.dart';

class OmniCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? borderRadius;
  final EdgeInsets? padding;
  const OmniCard(
      {super.key, this.child, this.color, this.borderRadius, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? const EdgeInsets.all(OmniConstants.kDefaultPadding),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              borderRadius ?? OmniConstants.kDefaultBorderRadius),
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
