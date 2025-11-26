import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabButton extends StatefulWidget {
  final List<String> tabs;
  final ValueChanged<int> onTabSelected;
  const CustomTabButton({
    super.key,
    required this.tabs,
    required this.onTabSelected,
  });

  @override
  State<CustomTabButton> createState() => _CustomTabButtonState();
}

class _CustomTabButtonState extends State<CustomTabButton> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Wrap(
        spacing: 16.w,
        runSpacing: 12.h,
        children: List.generate(
          widget.tabs.length,
          (index) => _buildTabButton(
            label: widget.tabs[index],
            isSelected: _selectedIndex == index,
            onTap:
                () => {
                  widget.onTabSelected(index),
                  setState(() {
                    _selectedIndex = index;
                  }),
                },
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected ? Color(0xFFD0E3D8) : Color(0xFFF1F5F9),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color:
                isSelected ? const Color(0xFF3FA96B) : const Color(0xFF352619),
          ),
        ),
      ),
    );
  }
}
