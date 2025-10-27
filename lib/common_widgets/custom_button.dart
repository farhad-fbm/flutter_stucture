import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class CustomButton extends StatelessWidget {
  final String? icon;
  final String text;
  final VoidCallback? onPressed;
  final BorderSide? border;
  final double borderRadius;
  final double? width;
  final Color? bgColor;
  final Color? foregroundColor;

  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.border,
    this.borderRadius = 12,
    this.width = double.infinity,
    this.bgColor = AppColors.allPrimaryColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? Colors.blue,
          foregroundColor: foregroundColor ?? AppColors.cFFFFFF,
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
          elevation: 0,
          side:
              AppColors.cFFFFFF == bgColor
                  ? BorderSide.none
                  : border ?? BorderSide(color: AppColors.c000000, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        child: Row(
          mainAxisAlignment:
              icon != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,

          children: [
            if (icon != null)
              Image.asset(
                icon!,
                height: 24.h,
                width: 24.w,
                // color: foregroundColor ?? Colors.white,
              ),
            Text(
              text,
              style: TextFontStyle.textStyle16c0184FFPoppins400
                  .copyWith(color: foregroundColor ?? AppColors.c000000),
            ),
            if (icon != null) UIHelper.horizontalSpace(24.w),
            // keeps text centered visually
          ],
        ),
      ),
    );
  }
}
