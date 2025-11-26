import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/navigation_service.dart';





// this part is to be used in the screen where image picker is needed

// File? image;
// final ImagePicker picker = ImagePicker();
// Future<void> pickImage(ImageSource source) async {
//   final XFile? pickedFile = await picker.pickImage(source: source);
//   if (pickedFile != null) {
//     setState(() {
//       image = File(pickedFile.path);
//     });
//   }
// }

void imagePickerDialog(BuildContext context, Function pickImage) {
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
