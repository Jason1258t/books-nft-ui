import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.appBar, this.bottomNavBar, this.child});

  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavBar,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('Assets/images/Background.png'),
            fit: BoxFit.cover,
          )),
          child: child),
    );
  }
}
