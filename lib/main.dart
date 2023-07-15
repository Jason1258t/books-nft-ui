import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/servise/custom_bloc_observer.dart';

import 'feature/book_info/ui/book_info_screen.dart';
import 'feature/describe_problem/ui/describe_problem_screen.dart';
import 'feature/home/bloc/home_cubit.dart';
import 'feature/home/data/homa_repository.dart';
import 'feature/home/home.dart';
import 'feature/auth/ui/auth_screen.dart';
import 'feature/login/ui/login_screen.dart';
import 'feature/register/ui/register_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  runApp(MyRepositoryProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        '/': (context) => const AuthScreen(),
        '/describe_problem_screen': (context) => const DescribeProblem(),
        '/book_info_screen': (context) => const BookInfoScreen(),
      },
    );
  }
}

class MyRepositoryProviders extends StatelessWidget {
  MyRepositoryProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (_) => HomeRepository()),
    ], child: MyBlocProviders());
  }
}

class MyBlocProviders extends StatelessWidget {
  MyBlocProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => HomeCubit(),
        lazy: false,
      ),
    ], child: const MyApp());
  }
}
