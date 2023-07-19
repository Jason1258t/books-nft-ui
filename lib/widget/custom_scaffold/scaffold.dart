import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      this.appBar,
      this.bottomNavBar,
      this.child,
      this.isButtonBack = false});

  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget? child;
  final bool isButtonBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavBar,
        body: Stack(children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('Assets/images/Background.png'),
                fit: BoxFit.cover,
              )),
              child: child),
          isButtonBack ? Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ) : Container(),
        ]));
  }
}
