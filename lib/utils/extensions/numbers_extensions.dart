import 'package:flutter/material.dart';

extension NumbersExtensions on num {
  bool get isEven => this == 0 || this % 2 == 0;
}
