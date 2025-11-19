import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/auth_app_bar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../gen/assets.gen.dart';

class HelpSupportScreeen extends StatefulWidget {
  const HelpSupportScreeen({super.key});

  @override
  State<HelpSupportScreeen> createState() => _HelpSupportScreeenState();
}

class _HelpSupportScreeenState extends State<HelpSupportScreeen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController issueController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthAppBar(title: "Help and Supports"),

              SizedBox(height: 24.h),
              CustomTextField(
                upperTitle: "Full Name",
                controller: nameController,
                hintText: 'Full Name',
                prefixIconPath: Assets.icons.profile.path,
              ),

              UIHelper.verticalSpace(16.h),
              CustomTextField(
                upperTitle: "Email Address",
                controller: emailController,
                hintText: 'Email',
                prefixIconPath: Assets.icons.email.path,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                upperTitle: "Subject",
                controller: subjectController,
                hintText: 'Subject Here',
                prefixIconPath: Assets.icons.profile.path,
              ),

              SizedBox(height: 16.h),

              CustomTextField(
                upperTitle: "Issue",
                controller: issueController,
                hintText: 'Describe your issue here',
                maxLines: 10,
              ),
              Spacer(),
              CustomButton(text: 'Send', onPressed: () {}),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
