import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../gen/colors.gen.dart';

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
    backgroundColor: bgColor ?? AppColors.c333842,
    icon: Icon(Icons.info_outline, color: AppColors.allPrimaryColor),
    titleText: Text(
      title,
      style: TextStyle(color: textColor ?? AppColors.allPrimaryColor),
    ),
    messageText: Text(
      message,
      style: TextStyle(
        color:
            textColor?.withValues(alpha: 0.5) ??
            AppColors.allPrimaryColor.withValues(alpha: 0.5),
      ),
    ),
  );
}
