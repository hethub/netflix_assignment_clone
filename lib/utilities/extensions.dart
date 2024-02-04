//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../constants/colors.dart';

/// Object Extension
///
extension ObjectFunc on Object {
  void print() => debugPrint(toString());
  void successSnackbar() {
    removeSnackbar();
    Get.snackbar(
      'Success',
      toString(),
      backgroundColor: C.success500,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void warningSnackbar() {
    removeSnackbar();
    Get.snackbar(
      'Warning',
      toString(),
      backgroundColor: C.warning500,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void errorSnackbar() {
    removeSnackbar();
    Get.snackbar(
      'Error',
      toString(),
      backgroundColor: C.error500,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
  }
}

/// Date Time Extension
///
extension DateFunc on DateTime? {
  /// Dateformate(dd MMM yy)
  /// ===
  String get formatDateddMMMyy {
    if (this == null) return '';
    final outputFormat = DateFormat("dd MMM yy");

    return outputFormat.format(this!);
  }
}
