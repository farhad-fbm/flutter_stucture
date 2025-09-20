import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

// ...existing code...
class CustomField extends StatefulWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final Widget? labelWithIcon;
  final TextStyle? labelTextStyle;
  final bool isOptional;
  final void Function(String)? onSubmitted;
  final bool editableHintText; // <-- Add this

  const CustomField({
    super.key,
    this.label,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.labelWithIcon,
    this.labelTextStyle,
    this.isOptional = false,
    this.onSubmitted,
    this.editableHintText = false, // <-- Add this
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _hasEdited = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();

    if (widget.editableHintText && (_controller.text.isEmpty)) {
      _controller.text = widget.hintText;
    }

    _focusNode.addListener(() {
      if (widget.editableHintText) {
        if (_focusNode.hasFocus &&
            !_hasEdited &&
            _controller.text == widget.hintText) {
          _controller.clear();
          setState(() {
            _hasEdited = true;
          });
        } else if (!_focusNode.hasFocus && _controller.text.isEmpty) {
          _controller.text = widget.hintText;
          setState(() {
            _hasEdited = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null || widget.labelWithIcon != null)
          widget.labelWithIcon ??
              Text(
                widget.label ?? "",
                style:
                    widget.labelTextStyle ??
                    TextFontStyle.textStyle14c0E1216Poppins400,
              ),
        UIHelper.verticalSpace(10.h),
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          onFieldSubmitted: widget.onSubmitted,
          validator:
              widget.isOptional
                  ? null
                  : (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
          style: TextFontStyle.textStyle12cA3A3A3Poppins400.copyWith(
            color:
                (_hasEdited || _controller.text != widget.hintText)
                    ? AppColors.c000000CC
                    : Colors.grey,
          ),
          maxLines: widget.maxLines,
          textAlign:
              widget.prefixIcon != null ? TextAlign.end : TextAlign.start,
          decoration: InputDecoration(
            fillColor: AppColors.cFFFFFF,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            hintText: widget.editableHintText ? null : widget.hintText,
            hintStyle: TextFontStyle.textStyle12cA3A3A3Poppins400.copyWith(
              color: AppColors.c000000CC,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.cEAEAEA),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.cEAEAEA),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.cEAEAEA),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
          ),
        ),
      ],
    );
  }
}
// ...existing code...