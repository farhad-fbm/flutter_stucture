import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../../common_widgets/custom_button.dart';

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
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.verticalSpace(16.h),

              // Text content
              const Text(
                "Are you sure to Log Out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Buttons row
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Cancel',
                    width: 200.w,
                    borderRadius: 16.r,
                    onPressed: () => Navigator.pop(context),
                  ),

                  UIHelper.verticalSpace(12.h),
                  CustomButton(
                    text: 'Log Out',
                    width: 200.w,
                    borderRadius: 16.r,
                    onPressed: () {
                      // NavigationService.navigateToReplacement(
                      //   Routes.profileHomeScreen,
                      // );
                    },
                    bgColor: Color(0xFF333842),
                    foregroundColor: Colors.red,
                    border: BorderSide(color: Colors.red, width: 2.w),
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
