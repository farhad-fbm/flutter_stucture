import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final BorderSide? borderSide;

  const CustomToggleButton({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.width = 50,
    this.height = 28,
    this.activeColor = const Color(0xFF4B9954),
    this.inactiveColor = const Color(0xFFCCC4B1),
    this.thumbColor = const Color(0xFFFFFFFF),
    this.borderSide,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      isOn = !isOn;
    });
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        width: widget.width.w,
        height: widget.height.h,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          color: isOn ? widget.activeColor : widget.inactiveColor,
          borderRadius: BorderRadius.circular(widget.height / 2),
          border:
              widget.borderSide != null
                  ? Border.fromBorderSide(widget.borderSide!)
                  : null,
        ),
        child: Align(
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: (widget.height - 6).h,
            height: (widget.height - 6).h,
            decoration: BoxDecoration(
              color: widget.thumbColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
