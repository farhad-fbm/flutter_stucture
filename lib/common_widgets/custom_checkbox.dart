import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value
            ? Icon(Icons.check, size: 16.w, color: Colors.black)
            : SizedBox(width: 16.w, height: 16.w),
      ),
    );
  }
}
