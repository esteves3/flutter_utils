extension NumExtensions on num {
  /// Returns the value of this [num] as a [String] with a fixed number of
  /// [decimals] digits.
  String toStringAsFixedDecimals(int decimals) {
    return toStringAsFixed(decimals);
  }

  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get days => Duration(days: toInt());
  Duration get weeks => Duration(days: toInt() * 7);
}
