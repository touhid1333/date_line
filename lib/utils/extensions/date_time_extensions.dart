import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get formatDDMMMM => DateFormat("dd MMMM", 'bn').format(this);

  String get formatE => DateFormat.E('bn').format(this);

  String get formatD => DateFormat.d('bn').format(this);

  String get formatHHmm12 => DateFormat('hh:mm', 'bn').format(this);

  String get formatHHmm24 => DateFormat('HH:mm', 'en').format(this);

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
