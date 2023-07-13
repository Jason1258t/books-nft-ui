import 'package:flutter/material.dart';

import 'feature/login/ui/login_screen.dart';
import 'feature/home/home.dart';
import 'feature/welcome/ui/welcom_screen.dart';

import 'feature/welcome/ui/welcom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login_screen': (context) => const LoginScreen(),
      },
    );
  }
}
