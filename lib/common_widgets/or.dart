import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/helpers/ui_helpers.dart';

class OrDivider extends StatelessWidget {
  final String? txt;
  final Color? color;
  const OrDivider({super.key, this.txt, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: Divider(thickness: 1, color: color ?? Colors.grey)),
        UIHelper.horizontalSpace(11.w),
        Text(
          txt ?? 'or',
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFF0184FF),
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
        UIHelper.horizontalSpace(11.w),

        Expanded(child: Divider(thickness: 1, color: color ?? Colors.grey)),
      ],
    );
  }
}
