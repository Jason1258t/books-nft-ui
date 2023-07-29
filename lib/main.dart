import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nft/bloc/app_cubit.dart';
import 'package:nft/feature/my_books/bloc/books/my_books_cubit.dart';
import 'package:nft/feature/my_books/bloc/moveBook/move_book_cubit.dart';
import 'package:nft/feature/my_books/bloc/wardrobe/wardrobe_cubit.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/feature/wallet/bloc/wallet_cubit.dart';
import 'package:nft/feature/wallet/data/wallet_repository.dart';
import 'package:nft/feature/wallet/ui/pincode.dart';
import 'package:nft/services/api_service.dart';
import 'package:nft/services/custom_bloc_observer.dart';

import 'data/app_repository.dart';
import 'feature/auth/bloc/code/code_cubit.dart';
import 'feature/auth/bloc/login/login_cubit.dart';
import 'feature/auth/ui/auth_screen.dart';
import 'feature/auth/ui/login_screen.dart';
import 'feature/auth/ui/register_screen.dart';
import 'feature/book_info/ui/book_info_screen.dart';
import 'feature/book_info/ui/second_book_info_screen.dart';
import 'feature/describe_problem/ui/describe_problem_screen.dart';
import 'feature/home/bloc/home_cubit.dart';
import 'feature/home/data/homa_repository.dart';
import 'feature/home/ui/home.dart';
import 'feature/profile/ui/profile_screen.dart';
import 'feature/store/ui/category_books_screen.dart';
import 'feature/wallet/ui/confirm_phrase.dart';
import 'feature/wallet/ui/import_wallet.dart';
import 'feature/wallet/ui/phrase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

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
        '/': (context) => const MyHomePage(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/describe_problem_screen': (context) => const DescribeProblem(),
        '/book_info_screen': (context) => const BookInfoScreen(),
        '/second_book_info_screen': (context) => const SecondBookInfoScreen(),
        '/category_books_screen': (context) => const CategoryBooksScreen(),
        '/import_wallet_screen': (context) => const ImportWalletScreen(),
        '/PIN_screen': (context) => const PINScreen(),
        '/phrase_screen': (context) => Phrase(),
        '/confirm_phrase_screen': (context) => const PhraseConfirm(),
        '/profile_screen': (context) => const ProfileScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppAuthState) {
          return const HomeScreen();
        } else if (state is AppUnAuthState) {
          return const AuthScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class MyRepositoryProviders extends StatelessWidget {
  MyRepositoryProviders({Key? key}) : super(key: key);
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (_) => HomeRepository()),
      RepositoryProvider(create: (_) => WalletRepository()),
      RepositoryProvider(create: (_) => AppRepository(apiService: apiService)),
      RepositoryProvider(
          create: (_) => MyBooksRepository(apiService: apiService)),
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
      BlocProvider(
        create: (_) => AppCubit(
            appRepository: RepositoryProvider.of<AppRepository>(context),
            myBooksRepository:
                RepositoryProvider.of<MyBooksRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => LoginCubit(
            appRepository: RepositoryProvider.of<AppRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => CodeCubit(
            appRepository: RepositoryProvider.of<AppRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => MyBooksCubit(
            myBooksRepository:
                RepositoryProvider.of<MyBooksRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => WardrobeCubit(
            myBooksRepository:
                RepositoryProvider.of<MyBooksRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => MoveBookCubit(
            myBooksRepository:
                RepositoryProvider.of<MyBooksRepository>(context)),
        lazy: false,
      ),
    ], child: const MyApp());
  }
}
