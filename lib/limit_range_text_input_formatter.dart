import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    if (int.tryParse(newValue.text) == null) {
      return oldValue;
    }

    var nValue = int.parse(newValue.text);
    if (nValue > max) {
      var oValue = int.parse(oldValue.text);
      return TextEditingValue(
          text: oValue.toString(),
          selection: TextSelection.collapsed(offset: oValue.toString().length));
    }
    return newValue;
  }
}
