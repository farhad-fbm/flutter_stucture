// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/text_font_style.dart';
// import '../gen/assets.gen.dart';
// import '../gen/colors.gen.dart';
// import '../helpers/navigation_service.dart';

// class CustomAppBar extends StatelessWidget {
//   final String title;
//   const CustomAppBar({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: () => NavigationService.goBack,
//               child: Container(
//                 height: 44.h,
//                 width: 44.w,
//                 decoration: BoxDecoration(
//                   color: AppColors.cF4D915,
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 child: Center(
//                   child: Assets.icons.arrowBack.image(
//                     color: AppColors.bgColor,
//                     height: 24.h,
//                     width: 24.w,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               title.toUpperCase(),
//               style: TextFontStyle.textStyle24cFFFFFFInterSemiBold600,
//             ),
           
//           ],
//         ),
//       ],
//     );
//   }
// }
