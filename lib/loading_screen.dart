import 'dart:async';
import 'package:dart_stucture/navigation_screen.dart';
import 'package:dart_stucture/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/post_login.dart';
import 'networks/dio/dio.dart';

final class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isLoading = true;
  bool isFirstTime = true;
  Timer? _timer;

  @override
  void initState() {
    loadInitialData();

    super.initState();
    _timer = Timer(const Duration(seconds: 35), () {
      if (_isLoading) {
        _handleLogout();
      }
    });
  }

  loadInitialData() async {
    await setInitValue();

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      await performPostLoginActions();
    } else {}
    setState(() {
      _timer!.cancel();
      _isLoading = false;
    });
  }

  void _handleLogout() {
    appData.write(kKeyIsLoggedIn, false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return const NavigationScreen();
    }
  }
}
