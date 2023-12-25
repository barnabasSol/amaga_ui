// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/auth/pages/phone/phone.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        kIsWeb || (Theme.of(context).platform == TargetPlatform.windows);
    if (isDesktop) {
      //return the desktop page
      return const Scaffold(
        body: Center(
          child: Text('This is a place holder for pc'),
        ),
      );
    }
    //else the phone page
    return const PhoneLoginPage();
  }
}
