import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/home/data/homa_repository.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/app_bar/app_bar.dart';
import 'package:nft/widget/custom_scaffold/custom_scaffold.dart';

import '../../my_books/ui/my_books_screen.dart';
import '../../my_books/ui/wardrobe_screen.dart';
import '../../store/ui/store_screen.dart';
import '../../wallet/ui/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeRepository = RepositoryProvider.of<HomeRepository>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<Widget> widgetOptions = <Widget>[
      const StoreScreen(),
      MyBooksScreen(
        onTap: (book, ctx) {
          Navigator.pushNamed(ctx, '/book_info_screen',
              arguments: {'book': book, 'owned': true});
        },
        books: RepositoryProvider.of<MyBooksRepository>(context).myBooks,
      ),
      const WardrobeScreen(),
      Container(),
      const WalletScreen()
    ];

    return WillPopScope(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          if (homeRepository.showBottomSheet) Navigator.pop(context);
        },
        child: CustomScaffold(
          appBar: homeRepository.isSecondScreen
              ? CustomAppBar(
                  width: width,
                  height: height,
                  context: context,
                )
              : null,
          bottomNavBar: Container(
            color: AppColors.bottomNavigationBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigatorBarItem(
                  asset: 'Assets/icons/store.svg',
                  activeAsset: 'Assets/icons/store_active.svg',
                  isSelected: homeRepository.selectedTab == 0,
                  text: 'Store',
                  onTap: () {
                    homeRepository.onSelectTab(0);
                    setState(() {});
                  },
                ),
                NavigatorBarItem(
                  asset: 'Assets/icons/books.svg',
                  activeAsset: 'Assets/icons/books_active.svg',
                  isSelected: homeRepository.selectedTab == 1,
                  text: 'My books',
                  onTap: () {
                    homeRepository.onSelectTab(1);
                    setState(() {});
                  },
                ),
                NavigatorBarItem(
                  asset: 'Assets/icons/home.svg',
                  activeAsset: 'Assets/icons/home_active.svg',
                  isSelected: homeRepository.selectedTab == 2,
                  text: 'Home',
                  onTap: () {
                    homeRepository.onSelectTab(2);
                    setState(() {});
                  },
                ),
                NavigatorBarItem(
                  asset: 'Assets/icons/events.svg',
                  activeAsset: 'Assets/icons/events_active.svg',
                  isActive: false,
                  isSelected: homeRepository.selectedTab == 3,
                  text: 'Events',
                  onTap: () {},
                ),
                NavigatorBarItem(
                  asset: 'Assets/icons/wallet.svg',
                  activeAsset: 'Assets/icons/wallet_active.svg',
                  isSelected: homeRepository.selectedTab == 4,
                  text: 'Wallet',
                  onTap: () {
                    homeRepository.onSelectTab(4);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          child: homeRepository.isSecondScreen
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Assets/images/Background.png'),
                    fit: BoxFit.cover,
                  )),
                  child: widgetOptions[homeRepository.selectedTab])
              : widgetOptions[homeRepository.selectedTab],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

// ignore: must_be_immutable
class NavigatorBarItem extends StatelessWidget {
  NavigatorBarItem(
      {Key? key,
      required this.asset,
      this.activeAsset,
      required this.isSelected,
      required this.text,
      this.isActive = true,
      required this.onTap})
      : super(key: key) {
    activeAsset = activeAsset ?? asset;
  }

  final String asset;
  String? activeAsset;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width / 5,
        height: 64,
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            color: isSelected
                ? AppColors.selectedBottomNavBarItem
                : isActive
                    ? AppColors.empty
                    : Colors.black26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  isSelected ? activeAsset! : asset,
                  height: 24,
                  width: 24,
                  color: isActive ? AppColors.goldText : Colors.blueGrey,
                ),
                Text(
                  text,
                  style: isActive
                      ? AppTypography.font12w700
                      : AppTypography.font12w700
                          .copyWith(color: Colors.blueGrey),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
