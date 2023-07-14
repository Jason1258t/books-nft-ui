import 'package:flutter/material.dart';

import 'feature/book_info/ui/book_info_screen.dart';
import 'feature/describe_problem/ui/describe_problem_screen.dart';
import 'feature/home/home.dart';
import 'feature/auth/ui/auth_screen.dart';
import 'feature/login/ui/login_screen.dart';
import 'feature/register/ui/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      routes: {
        '/home_screen': (context) => const HomeScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/' : (context) => const AuthScreen(),
        '/describe_problem_screen' : (context) => const DescribeProblem(),
        '/book_info_screen' : (context) => const BookInfoScreen(),
      },
    );
  }
}
