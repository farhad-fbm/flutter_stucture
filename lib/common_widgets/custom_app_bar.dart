import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/navigation_service.dart';
import '../helpers/ui_helpers.dart';

class TopRow extends StatelessWidget {
  final bool hasNotification;
  final String title;
  const TopRow({super.key, required this.title, this.hasNotification = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIHelper.verticalSpace(60.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => NavigationService.goBack,
              child: Container(
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                  color: AppColors.cF4D915,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Assets.icons.arrowBack.image(
                    color: AppColors.bgColor,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFF071431),
                fontWeight: FontWeight.w600,
              ),
            ),
            hasNotification
                ? InkWell(
                  onTap: () {
                    //
                  },
                  child: SizedBox(
                    height: 32.h,
                    width: 32.w,
                    child: Center(
                      child: Assets.icons.bell.image(height: 24.h, width: 24.w),
                    ),
                  ),
                )
                : SizedBox(height: 44.h, width: 44.w),
          ],
        ),
      ],
    );
  }
}
