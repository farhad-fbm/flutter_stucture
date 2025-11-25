import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../common_widgets/custom_app_bar.dart';
import '../../../common_widgets/custom_scaffold.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import 'logout_modal.dart';

final List<Map<String, dynamic>> profileOptions = [
  {
    'icon': Assets.icons.edit.path,
    'title': 'Edit Address',
    'onTap': () {
    },
  },
  {
    'icon': Assets.icons.edit.path,
    'title': 'Change Password',
    'onTap': () {
    },
  },
  {
    'icon': Assets.icons.edit.path,
    'title': 'View Documents',
    'onTap': () {
    },
  },
  {
    'icon': Assets.icons.edit.path,
    'title': 'Language',
    'onTap': () {
      // Navigate to Privacy Policy
    },
  },
];



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Profile"),
          SizedBox(height: 20.h),
          Row(
            spacing: 12.w,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.placeholderImage.path,
                width: 64.w,
                height: 64.h,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "john.doe@example.com",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Image.asset(
                Assets.icons.edit.path,
                width: 24.w,
                height: 24.h,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildProfileOptionsCCard(
            options: profileOptions,
            color: Color(0xFF32343E),
          ),

        
        ],
      ),
    );
  }

  Widget _buildProfileOptionsCCard({
    required List<Map<String, dynamic>> options,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          spacing: 24.h,
          children:
              options.map((option) {
                return InkWell(
                  onTap: option['onTap'],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 14.w,
                    children: [
                      Image.asset(
                        option['icon'],
                        width: 24.w,
                        height: 24.h,
                        color: color,
                      ),
                      Expanded(
                        child: Text(
                          option['title'],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: color,
                          ),
                        ),
                      ),
                      Image.asset(
                        Assets.icons.arrowRightLong.path,
                        width: 32.w,
                        height: 32.h,
                        color: color,
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
