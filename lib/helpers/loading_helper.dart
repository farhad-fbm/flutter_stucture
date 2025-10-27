import 'package:flutter/material.dart';
import '../common_widgets/custom_circle_loader.dart';

import 'navigation_service.dart';

extension Loader on Future {
  Future<dynamic> waitingForFutureWithoutBg() async {
    showDialog(
      context: NavigationService.context,
      builder: (context) => loadingIndicatorCircle(context: context),
    );

    try {
      // Wait for the original future to complete
      dynamic result = await this;
      return result;
    } finally {
      // Close the loading dialog
      NavigationService.goBack;
    }
  }
}
