

import '../constants/app_constants.dart';
import '../networks/dio/dio.dart';
import 'di.dart';

Future<void> performPostLoginActions() async {
  final token = await appData.read(kKeyAccessToken);
  DioSingleton.instance.update(token);
  // API CALL 1 - If this fails with global error
  // await apiCall1();
  // // API CALL 2 - Won't execute
  // await apiCall2();
  // // API CALL 3 - Won't execute
  // await apiCall3();
}
