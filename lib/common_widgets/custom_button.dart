import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? icon;
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final BorderSide? borderSide;
  final double borderRadius;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final Color? foregroundColor;

  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.borderColor,
    this.borderSide,
    this.borderRadius = 12,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    this.bgColor = const Color(0xFF008BC1),
    this.foregroundColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius.r),

        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius.r),
            border: borderSide != null
                ? Border.fromBorderSide(borderSide!)
                : borderColor != null
                ? Border.all(color: borderColor!, width: 1.w)
                : null,
          ),

          child: Row(
            spacing: 10.w,
            mainAxisAlignment: icon != null
                ? MainAxisAlignment.center
                : MainAxisAlignment.center,
            children: [
              if (icon != null) Image.asset(icon!, height: 24.h, width: 24.w),

              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: foregroundColor,
                  fontWeight: FontWeight.w700,
                ),
              ),

              if (icon != null) SizedBox(width: 24.w),
            ],
          ),
        ),
      ),
    );
  }
}
