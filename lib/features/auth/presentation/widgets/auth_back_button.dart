import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Image.asset(Assets.icons.arrowLeft.path, width: 24, height: 24),
    );
  }
}
