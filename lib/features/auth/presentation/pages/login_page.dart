// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/auth/presentation/pages/desktop/desktop.dart';
import 'package:amaga/features/auth/presentation/pages/phone/phone.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = kIsWeb ||
        (Theme.of(context).platform != TargetPlatform.iOS &&
            Theme.of(context).platform != TargetPlatform.android);
    if (isDesktop) {
      //return the desktop page
      return const DesktopLoginPage();
    } else {
      //the phone page
      return const PhoneLoginPage();
    }
  }
}
