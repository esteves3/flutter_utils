extension DurationExt on int {
  Duration get ms => Duration(milliseconds: this);
  Duration get sec => Duration(seconds: this);
  Duration get min => Duration(minutes: this);
  Duration get hour => Duration(hours: this);
  Duration get day => Duration(days: this);
}
