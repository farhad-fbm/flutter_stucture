import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

Future<void> urlLunch(String url) async {
  final uri = Uri.parse(url);

  if (Platform.isIOS) {
    // Same as: forceSafariVC: false
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    // Same as: forceWebView: false
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
