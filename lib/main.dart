import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:auto_animated/auto_animated.dart';
import 'helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/navigation_service.dart';
import 'navigation_screen.dart';
import 'networks/dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await _requestPermissions();
  await GetStorage.init();
  diSetup();
  // initiInternetChecker();
  DioSingleton.instance.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return AnimateIfVisibleWrapper(
      showItemInterval: const Duration(milliseconds: 150),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return const UtillScreenMobile();
        },
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light, // White icons (Android)
            statusBarBrightness: Brightness.dark, // White icons (iOS)
          ),
          child: GetMaterialApp(
            initialRoute: '/',
            darkTheme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            theme: ThemeData(
              unselectedWidgetColor: Colors.white,
              primarySwatch: Colors.blue,
              primaryColor: const Color(0xFFFFFFFF),
              useMaterial3: false,
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFFFFFFFF),
                elevation: 0,
              ),
            ),
            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            home: const NavigationScreen(),
          ),
        );
      },
    );
  }
}
