import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customToastMessage({
  required String title,
  required String message,
  Color? bgColor,
  Color? textColor,
}) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: bgColor ?? Color(0xFF333842),
    icon: Icon(Icons.info_outline, color: Color(0xFF0184FF)),
    titleText: Text(
      title,
      style: TextStyle(color: textColor ?? Color(0xFF0184FF)),
    ),
    messageText: Text(message, style: TextStyle(color: Color(0xFF0184FF))),
  );
}
