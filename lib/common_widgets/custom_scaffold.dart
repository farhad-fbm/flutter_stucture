import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  final Color backgroundColor;
  final bool lightIcons;
  final Widget body;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    super.key,
    this.backgroundColor = Colors.black,
    this.lightIcons = true,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: lightIcons
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: lightIcons
            ? Brightness.light
            : Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
