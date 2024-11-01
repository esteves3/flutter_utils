import 'package:flutter/material.dart';

class OmniButton extends StatefulWidget {
  final Function() onPressed;
  final Color? bgColor;
  final bool isOutlined, disabled;
  final Widget child;
  const OmniButton(
      {super.key,
      required this.onPressed,
      this.bgColor,
      required this.child,
      this.isOutlined = false,
      this.disabled = false});

  @override
  State<OmniButton> createState() => _OmniButtonState();
}

class _OmniButtonState extends State<OmniButton> {
  var isLoading = false;

  Future<Null> Function()? fun;

  @override
  void initState() {
    fun = widget.disabled
        ? null
        : () async {
            if (isLoading) return;
            setState(() {
              isLoading = true;
            });
            await widget.onPressed();
            setState(() {
              isLoading = false;
            });
          };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var child = isLoading
        ? const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2,
            ))
        : widget.child;
    return Center(
      child: widget.isOutlined || isLoading
          ? OutlinedButton(
              onPressed: fun,
              style: OutlinedButton.styleFrom(
                disabledMouseCursor: SystemMouseCursors.forbidden,
              ),
              child: child,
            )
          : ElevatedButton(
              onPressed: fun,
              style: ElevatedButton.styleFrom(
                  foregroundColor: widget.bgColor?.getTextColor,
                  disabledMouseCursor: SystemMouseCursors.forbidden,
                  backgroundColor: widget.bgColor),
              child: child,
            ),
    );
  }
}

extension on Color? {
  get getTextColor => null;
}
