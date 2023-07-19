import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/wallet/bloc/wallet_cubit.dart';
import 'package:nft/feature/wallet/data/wallet_repository.dart';
import 'package:nft/feature/wallet/ui/pincode.dart';
import 'package:nft/serviсe/custom_bloc_observer.dart';

import 'feature/auth/ui/auth_screen.dart';
import 'feature/book_info/ui/book_info_screen.dart';
import 'feature/describe_problem/ui/describe_problem_screen.dart';
import 'feature/home/bloc/home_cubit.dart';
import 'feature/home/data/homa_repository.dart';
import 'feature/home/home.dart';
import 'feature/login/ui/login_screen.dart';
import 'feature/register/ui/register_screen.dart';
import 'feature/store/ui/category_books_screen.dart';
import 'feature/wallet/ui/confirm_phrase.dart';
import 'feature/wallet/ui/import_wallet.dart';
import 'feature/wallet/ui/phrase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  runApp(const MyRepositoryProviders());
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
        '/category_books_screen': (context) => const CategoryBooksScreen(),
        '/import_wallet_screen': (context) => const ImportWalletScreen(),
        '/PIN_screen': (context) => const PINScreen(),
        '/phrase_screen': (context) => Phrase(),
        '/confirm_phrase_screen': (context) => const PhraseConfirm(),
      },
    );
  }
}

class MyRepositoryProviders extends StatelessWidget {
  const MyRepositoryProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (_) => HomeRepository()),
      RepositoryProvider(create: (_) => WalletRepository()),
    ], child: const MyBlocProviders());
  }
}

class MyBlocProviders extends StatelessWidget {
  const MyBlocProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => HomeCubit(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => WalletCubit(
            walletRepository: RepositoryProvider.of<WalletRepository>(context)),
        lazy: false,
      ),
    ], child: const MyApp());
  }
}
