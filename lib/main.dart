import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/screens/home_screen.dart';
import 'package:pretium/screens/login.dart';
import 'package:pretium/screens/main_screen.dart';
import 'package:pretium/screens/onboarding_screen.dart';
import 'package:pretium/screens/register_screen.dart';
import 'package:pretium/screens/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pretium',
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SplashScreen(),
        '/onboarding_screen': (context) => OnboardingScreen(),
        '/login':(context) => Login(),
        '/register':(context) => RegisterScreen(),
        '/home':(context) => HomeScreen(),
        '/main':(context) => MainScreen(),

      },
    );
  }
}

