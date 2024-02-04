import 'package:flutter/material.dart';

sealed class Gap {
  static const SizedBox kGap = SizedBox(height: 10);
  static const SizedBox kGapLarge = SizedBox(height: 20);
  static const SizedBox kXL = SizedBox(height: kToolbarHeight);
}
