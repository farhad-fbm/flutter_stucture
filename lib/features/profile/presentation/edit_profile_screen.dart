import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common_widgets/custom_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/auth_app_bar.dart';
import '../../../common_widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  File? image;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                UIHelper.verticalSpace(8.h),
                Text(
                  "Set new picture",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                const Divider(color: Colors.black26),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 80.h,
                          width: 80.w,
                          child: IconButton(
                            icon: Assets.icons.logo.image(fit: BoxFit.cover),
                            onPressed: () {
                              NavigationService.goBack;
                              pickImage(ImageSource.camera);
                            },
                          ),
                        ),
                        const Text("Camera"),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 80.h,
                          width: 80.w,
                          child: IconButton(
                            icon: Assets.icons.avater.image(fit: BoxFit.cover),
                            onPressed: () {
                              NavigationService.goBack;
                              pickImage(ImageSource.gallery);
                            },
                          ),
                        ),
                        const Text("Gallery"),
                      ],
                    ),
                  ],
                ),
                UIHelper.verticalSpace(32.h),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              AuthAppBar(title: "Edit Profile"),

              UIHelper.verticalSpace(24.h),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundImage:
                        image != null
                            ? FileImage(image!)
                            : AssetImage(Assets.icons.avater.path)
                                as ImageProvider,
                  ),

                  Positioned(
                    bottom: 4.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: showImagePickerOptions,
                      child: Image.asset(
                        Assets.icons.camera.path,
                        height: 24.h,
                        width: 24.w,
                        color: Color(0xFF96DD00),
                      ),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(32.h),
              // ___________________________________
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

              Spacer(),
              CustomButton(text: 'Update Information', onPressed: () {}),
              UIHelper.verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
