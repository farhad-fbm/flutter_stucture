import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreenTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const AuthScreenTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8.h,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 32.sp,
            color: const Color(0xFF212121),
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 8.h),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF071431),
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ],
    );
  }
}
