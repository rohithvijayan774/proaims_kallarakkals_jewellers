import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proaims_test/const.dart';
import 'package:proaims_test/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  gotoNextPage() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Login(),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    gotoNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: brownColor,
      body: Center(
        child: Container(
          width: width,
          height: height / 3,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/logo-512.png'))),
        ),
      ),
    );
  }
}
