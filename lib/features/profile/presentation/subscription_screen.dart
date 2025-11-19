import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/auth_app_bar.dart';
import '../../../common_widgets/custom_button.dart';

final premiumPlanFeatures = [
  'Unlimited key scans',
  'Full AI-powered key detection',
  'Real-time cross-reference database',
  'Priority support and updates',
  'Priority support and updates',
];
final freePlanLimitations = [
  [true, 'Scan up to 1 key per day'],
  [true, 'Get basic key type detection'],
  [true, 'View limited manufacturer info'],
  [true, 'Access sample cross-reference \nresults'],
  [false, 'No access to advanced AI training or \nfull database'],
  [false, 'No priority support'],
];

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthAppBar(title: 'Subscription & Plan'),
                UIHelper.verticalSpace(24.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Color(0xFF96DD00), width: 2.w),
                  ),
                  child: Column(
                    children: [
                      UIHelper.verticalSpace(24.h),
                      Image.asset(Assets.icons.logo.path, height: 24 .h),
                      UIHelper.verticalSpace(16.h),
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      UIHelper.verticalSpace(16.h),
                      Container(color: Color(0xFFFFFFFF), height: .5.h),

                      ...freePlanLimitations.map(
                        (feature) => Column(
                          children: [
                            UIHelper.verticalSpace(16.h),
                            _buildSubscriptionOption(
                              title: feature[1] as String,
                              available: feature[0] as bool,
                            ),
                          ],
                        ),
                      ),

                      UIHelper.verticalSpace(24.h),
                      Container(color: Color(0xFFDBDBDB), height: 1.h),
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'Your current plan',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(32.h),

                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Color(0xFF96DD00),
                          width: 2.w,
                        ),
                      ),
                      child: Column(
                        children: [
                          UIHelper.verticalSpace(24.h),
                          Image.asset(Assets.icons.logo.path, height: 24.h),
                          UIHelper.verticalSpace(16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$4.99',
                                style: TextStyle(
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              Text(
                                '/month',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          UIHelper.verticalSpace(16.h),
                          Container(color: Color(0xFFFFFFFF), height: .5.h),
                          UIHelper.verticalSpace(16.h),
                          ...premiumPlanFeatures.map(
                            (feature) => Column(
                              children: [
                                UIHelper.verticalSpace(16.h),
                                _buildSubscriptionOption(title: feature),
                              ],
                            ),
                          ),
                          UIHelper.verticalSpace(24.h),
                          Container(color: Color(0xFFDBDBDB), height: 1.h),
                          UIHelper.verticalSpace(24.h),

                          CustomButton(
                            text: 'Upgrade to Premium',
                            onPressed: () {},
                          ),
                          UIHelper.verticalSpace(24.h),
                        ],
                      ),
                    ),

                    Positioned(
                      right: 0.w,
                      top: 0,
                      child: ClipRRect(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF96DD00),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.r),
                              bottomLeft: Radius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Premium',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption({
    bool? available = true,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          available! ? Icons.check : Icons.close,
          color: Color(0xFF000000),
          size: 20.sp,
        ),
        UIHelper.horizontalSpace(8.w),
        Text(
          title,
          style: TextStyle(color: Color(0xFF000000), fontSize: 16.sp),
        ),
      ],
    );
  }
}
