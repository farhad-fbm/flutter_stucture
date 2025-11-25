import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/ui_helpers.dart';
import '../../../../common_widgets/custom_button.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

void logoutModal(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.verticalSpace(16.h),

              // Text content
              Text(
                "Are you sure to Log Out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),

              // Buttons row
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Cancel',
                    width: 200.w,
                    borderRadius: 16.r,
                    onPressed: () => Navigator.pop(context),
                    bgColor: Color(0xFFEEF5EE),
                    foregroundColor: Color(0xFF4B9954),
                  ),

                  UIHelper.verticalSpace(12.h),
                  CustomButton(
                    text: 'Log Out',
                    width: 200.w,
                    borderRadius: 16.r,
                    onPressed: () {
                      NavigationService.navigateToReplacement(
                        Routes.signInScreen,
                      );
                    },
                    bgColor: Color(0xFFFDF2F2),
                    foregroundColor: Colors.red,
                    border: BorderSide(color: Colors.red, width: 1.w),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
