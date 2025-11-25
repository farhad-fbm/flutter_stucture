import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_app_bar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/navigation_service.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

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
                SizedBox(height: 12.h),
                Text(
                  "Set New Picture",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12.h),
                const Divider(color: Colors.black26),
                SizedBox(height: 16.h),
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
                            icon: Icon(Icons.photo_camera, size: 40.h),
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
                            icon: Icon(Icons.photo_library, size: 40.h),
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
                SizedBox(height: 32.h),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Edit"),
          SizedBox(height: 16.h),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 16.h),
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
                        child: Icon(
                          Icons.add_a_photo,
                          size: 28.h,
                          color: Color(0xFF898989),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // ___________________________________
                      CustomTextField(
                        upperTitle: "Full Name",
                        controller: nameController,
                        hintText: 'Full Name',
                        // prefixIconPath: Assets.icons.profile.path,
                      ),

                      SizedBox(height: 16.h),
                      CustomTextField(
                        upperTitle: "Email Address",
                        controller: emailController,
                        hintText: 'Email',
                        // prefixIconPath: Assets.icons..path,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        upperTitle: "Number",
                        controller: phoneController,
                        hintText: 'Phone Number',
                        // prefixIconPath: Assets.icons..path,
                      ),

                      // Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                CustomButton(text: 'Save', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
