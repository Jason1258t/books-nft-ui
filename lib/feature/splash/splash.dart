import 'package:flutter/material.dart';

class FakeSplashScreen extends StatelessWidget {
  const FakeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff63594B),
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
                backgroundColor: Color(0xff3A2635),
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
