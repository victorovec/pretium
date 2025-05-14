import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding_screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF104b45),
      body: SafeArea(
        child: Container(
          color: Color(0xFF16655e),
          child: Center(
            child: Image.asset(
              'assets/icons/pretium_logo.png',
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
