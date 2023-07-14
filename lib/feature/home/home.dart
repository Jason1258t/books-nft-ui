import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/wallet/ui/wallet.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/stats/stat.dart';

import '../my_books/ui/my_books.dart';
import '../wallet/ui/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const Text('Store'),
      const MyBooksScreen(),
      const Text('Delection'),
      const Text('Events'),
      const WalletScreen()
    ];

    void onSelectTab(int index) {
      if (_selectedTab == index) return;
      setState(() {
        _selectedTab = index;
      });
    }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          backgroundColor: AppColors.bottomNavigationBackground,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserStat(
                  text: 'x1.4', fill: 0, asset: 'Assets/icons/Vector-2.svg'),
              UserStat(
                  text: '3,3/5',
                  fill: 3.3 / 5,
                  asset: 'Assets/icons/energy.svg'),
              UserStat(
                  text: '85%', fill: 0.85, asset: 'Assets/icons/shield.svg'),
            ],
          ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('Assets/images/Background.png'),
              fit: BoxFit.cover,
            )),
            child: widgetOptions[_selectedTab]),
        bottomNavigationBar: Container(
          color: AppColors.bottomNavigationBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigatorBarItem(
                asset: 'Assets/icons/store.svg',
                activeAsset: 'Assets/icons/store_active.svg',
                isSelected: _selectedTab == 0,
                text: 'Store',
                onTap: () {
                  onSelectTab(0);
                },
              ),
              NavigatorBarItem(
                asset: 'Assets/icons/books.svg',
                activeAsset: 'Assets/icons/books_active.svg',
                isSelected: _selectedTab == 1,
                text: 'My books',
                onTap: () {
                  onSelectTab(1);
                },
              ),
              NavigatorBarItem(
                asset: 'Assets/icons/home.svg',
                activeAsset: 'Assets/icons/home_active.svg',
                isSelected: _selectedTab == 2,
                text: 'Home',
                onTap: () {
                  onSelectTab(2);
                },
              ),
              NavigatorBarItem(
                asset: 'Assets/icons/events.svg',
                isSelected: _selectedTab == 3,
                text: 'Events',
                onTap: () {
                  onSelectTab(3);
                },
              ),
              NavigatorBarItem(
                asset: 'Assets/icons/wallet.svg',
                activeAsset: 'Assets/icons/wallet_active.svg',
                isSelected: _selectedTab == 4,
                text: 'Wallet',
                onTap: () {
                  onSelectTab(4);
                },
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

class NavigatorBarItem extends StatelessWidget {
  NavigatorBarItem(
      {Key? key,
      required this.asset,
      this.activeAsset,
      required this.isSelected,
      required this.text,
      required this.onTap})
      : super(key: key) {
    activeAsset = activeAsset ?? asset;
  }

  final String asset;
  String? activeAsset;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 72,
        height: 64,
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  isSelected ? activeAsset! : asset,
                  height: 24,
                  width: 24,
                ),
                Text(
                  text,
                  style: AppTypography.font12w700,
                )
              ],
            ),
          ),
          if (isSelected) ...[
            Container(
              width: 72,
              height: 64,
              decoration: BoxDecoration(
              //     gradient: LinearGradient(colors: [
              //   Colors.white.withAlpha(100),
              //   const Color.fromARGB(0, 1, 1, 1)
              // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                color: Colors.orange.withAlpha(50)
            ))
          ]
        ]),
      ),
    );
  }
}
