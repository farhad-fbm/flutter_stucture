import 'package:dotted_border/dotted_border.dart';    //  dotted_border: ^2.1.0
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.white, // dotted border color
      strokeWidth: 2,
      dashPattern: [6, 8], // dot-length, gap-length
      borderType: BorderType.Circle,
      padding: EdgeInsets.all(1.w), // space between image & border
      child: ClipOval(
        child: Icon(Icons.camera, size: 50.w, color: Colors.white),
      ),
    );
  }
}
