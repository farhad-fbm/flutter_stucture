import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

final List<Map<String, dynamic>> list = [
  {
    'title': 'Upgrade Plan',
    // 'icon': Assets.icons.upgrade.path,
    'onPressed': () {
      // NavigationService.navigateTo(Routes.subscriptionScreen);
    },
  },
  {
    'title': 'Change Password',
    'icon': Assets.icons.password.path,
    'onPressed': () {
      // NavigationService.navigateTo(Routes.changePasswordScreen);
    },
  },
  {
    'title': 'Privacy Policy',
    'icon': Assets.icons.privacy.path,
    'onPressed': () {},
  },
  {
    'title': 'Contact Support',
    'icon': Assets.icons.contact.path,
    'onPressed': () {
      // NavigationService.navigateTo(Routes.helpSupportScreen);
    },
  },
];

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFEFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.icons.logo.path, width: 17, height: 24),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 8),
                ],
              ),
              SizedBox(height: 32.h),
              CircleAvatar(
                radius: 50.r,
                backgroundImage: AssetImage(Assets.icons.avater.path),
              ),
              SizedBox(height: 16.h),
              Text(
                'Johan',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Text(
                'johan@example.com',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: () {
                  // NavigationService.navigateTo(Routes.editProfileScreen);
                },
                child: Image.asset(
                  Assets.icons.edit.path,
                  height: 32.h,
                  width: 32.w,
                ),
              ),

              ListView.builder(
                shrinkWrap: true, // fixes unbounded height
                physics:
                    NeverScrollableScrollPhysics(), //  prevents nested scrolling
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: SettingItem(
                      iconImg: item['icon']!,
                      title: item['title']!,
                      onPressed: item['onPressed'],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String? iconImg;
  final String? title;
  final VoidCallback? onPressed;

  const SettingItem({super.key, this.iconImg, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          if (iconImg != null)
            Image.asset(
              iconImg!,
              width: 56.w,
              height: 56.h,
              // color: Color(0xFFD8DDE8),
            ),
          SizedBox(width: 12.w),
          Text(
            title!,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000),
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 24.sp),
        ],
      ),
    );
  }
}
