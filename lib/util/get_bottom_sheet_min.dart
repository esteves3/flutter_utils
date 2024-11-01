import 'package:flutter/material.dart';

void getBottomSheetMin(BuildContext context, List<Widget> lst,
    {Color backgroundColor = Colors.white}) {
  showModalBottomSheet(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Column(
              children: lst,
            ),
          ],
        );
      });
}
