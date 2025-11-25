import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? iconPath;
  final VoidCallback? onPressed;
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconPath,
    this.onPressed,
  });

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
        iconPath != null
            ? IconButton(icon: Image.asset(iconPath!), onPressed: onPressed)
            : SizedBox(width: 8.w),
      ],
    );
  }
}
