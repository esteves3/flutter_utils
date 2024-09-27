import 'package:flutter/material.dart';

class LoaderButton extends StatefulWidget {
  final Function() onPressed;
  final Color? bgColor;
  final bool isOutlined, disabled;
  final Widget child;
  const LoaderButton(
      {super.key,
      required this.onPressed,
      this.bgColor,
      required this.child,
      this.isOutlined = false,
      this.disabled = false});

  @override
  State<LoaderButton> createState() => _LoaderButtonState();
}

class _LoaderButtonState extends State<LoaderButton> {
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
                  disabledMouseCursor: SystemMouseCursors.forbidden,
                  backgroundColor: widget.bgColor),
              child: child,
            ),
    );
  }
}
