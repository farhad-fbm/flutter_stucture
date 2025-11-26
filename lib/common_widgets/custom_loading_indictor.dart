import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../gen/assets.gen.dart';

Widget loadingIndicatorCircle({
  required BuildContext context,
  Color? color,
  double? size,
}) {
  double loaderSize = 200.sp;
  return DotLottieLoader.fromAsset(
    Assets.lottie.waiting,
    frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
      if (dotlottie != null) {
        return Center(
          child: Container(
            child: Lottie.memory(
              dotlottie.animations.values.single,
              height: loaderSize,
              width: loaderSize,
            ),
          ),
        );
      } else {
        return Container();
      }
    },
  );
}

Widget shimmer({
  String? name,
  required BuildContext context,
  Color? color,
  double? size,
}) {
  return Center(
    child: Container(
      child: Lottie.asset(
        name ?? Assets.lottie.hamburger,
        width: size,
        height: size,
      ),
    ),
  );
}

Widget linearProgressBar({
  required double value,
  Color? color,
  Color? backgroundColor,
  double? height,
  double? radius,
}) {
  return SizedBox(
    height: height ?? 8.0,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 8.0),
      child: LinearProgressIndicator(
        value: value.clamp(0.0, 1.0),
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? const Color(0xFF86C027),
        ),
        backgroundColor: backgroundColor ?? const Color(0xFFE8EEF7),
      ),
    ),
  );
}
