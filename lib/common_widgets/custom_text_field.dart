import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FieldType { name, email, password, confirmPassword }

class CustomTextField extends StatelessWidget {
  final String? upperTitle;
  final String? labelText;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? paddingVertical;
  final TextEditingController controller;
  final TextEditingController? confirmPasswordController;
  final FieldType? fieldType;
  final bool isPassword;
  final bool obscureText;
  final bool toggleVisible;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconPressed;
  final bool readonly;
  final VoidCallback? onTap;
  final int? maxLines;

  const CustomTextField({
    this.upperTitle,
    super.key,
    this.labelText,
    this.prefixIconPath,
    this.suffixIconPath,
    this.hintText,
    this.fillColor = const Color(0xFFF3F7FF),
    this.borderColor = Colors.transparent,
    this.borderRadius = 100,
    this.paddingVertical = 16,
    required this.controller,
    this.confirmPasswordController,
    this.fieldType,
    this.isPassword = false,
    this.obscureText = false,
    this.toggleVisible = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.onSuffixIconPressed,
    this.readonly = false,
    this.onTap,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (upperTitle != null) ...[
          Padding(
            padding: EdgeInsets.only(bottom: 8.h, left: 8.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                upperTitle!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onChanged,
            validator: validator,
            readOnly: readonly,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            cursorColor: const Color(0xFFFFFFFF),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.r,
                vertical: paddingVertical?.r ?? 16.r,
              ),
              labelText: labelText,
              // floatingLabelBehavior: FloatingLabelBehavior.always, //------
              labelStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9E9E9E),
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
              ),

              filled: true,
              fillColor: fillColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!.r),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 2,
                ),
              ),
              prefixIcon:
                  prefixIconPath != null
                      ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Image.asset(
                          prefixIconPath!,
                          width: 20.w,
                          height: 20.h,
                          fit: BoxFit.contain,
                          color: const Color(0xFF000000),
                        ),
                      )
                      : null,

              suffixIcon:
                  suffixIconPath != null
                      ? InkWell(
                        onTap: onSuffixIconPressed,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Image.asset(
                            suffixIconPath!,
                            width: 16.w,
                            height: 16.h,
                            fit: BoxFit.contain,
                            // color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      )
                      : null,
              suffixIconConstraints: BoxConstraints(
                maxWidth: 40.w,
                maxHeight: 40.h,
                minWidth: 40.w,
                minHeight: 40.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
