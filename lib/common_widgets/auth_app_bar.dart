import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppBar extends StatelessWidget {
  final String title;
  const AuthAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          title,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
