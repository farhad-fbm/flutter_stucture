import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.borderRadius = 100,
    this.width = double.infinity,
    this.bgColor = const Color(0xFF4B9954),
    this.foregroundColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? const Color(0xFF4B9954),
          foregroundColor: foregroundColor ?? const Color(0xFFFFFFFF),
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
          elevation: 0,
          // side:
          //     const Color(0xFFFFFFFF) == bgColor
          //         ? BorderSide.none
          //         : border ??
          //             BorderSide(color: const Color(0xFF000000), width: 1.w),
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
            if (icon != null) Image.asset(icon!, height: 24.h, width: 24.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: foregroundColor ?? const Color(0xFF000000),
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
            if (icon != null) SizedBox(width: 24.w),
          ],
        ),
      ),
    );
  }
}
