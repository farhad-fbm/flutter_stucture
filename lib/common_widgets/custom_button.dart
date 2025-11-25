import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? icon;
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final BorderSide? border;
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
    this.border,
    this.borderRadius = 100,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    this.bgColor = const Color(0xFF4B9954),
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
            border:
                border != null
                    ? Border.fromBorderSide(border!)
                    : borderColor != null
                    ? Border.all(color: borderColor!, width: 1.w)
                    : null,
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
                  color: foregroundColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
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
