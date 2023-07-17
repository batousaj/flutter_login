import 'package:flutter/material.dart';
import 'package:VPRO/Common/Reponsive/Responsive.dart';
import 'package:VPRO/LoginScreen/Components/login_desktop_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Responsive(
        desktop: const LoginDesktopScreen(
      title: 'VPRO',
    ));
  }
}
