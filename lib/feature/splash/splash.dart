import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

class FakeSplashScreen extends StatelessWidget {
  const FakeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bottomNavigationBackground,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Image.asset(
                  'Assets/images/splash.png', width: double.infinity,),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 64),
              child: const CircleAvatar(radius: 16,
                backgroundColor: AppColors.darkText,
                child: SizedBox(width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 3,),),),)
          ],
        ),
      ),
    );
  }
}
