import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/images/Background.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
