
import '../constants/app_constants.dart';
import '../networks/dio/dio.dart';
import 'di.dart';

Future<void> performPostLoginActions() async {
  final token = await appData.read(kKeyAccessToken);
  DioSingleton.instance.update(token);
}
