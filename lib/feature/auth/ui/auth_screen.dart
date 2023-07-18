import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';
import 'package:nft/widget/buttons/custom_text_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('Assets/icons/logo.svg',color: Colors.white,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(text: 'LOGIN', onTap: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextButton(text: 'REGISTER', onTap: () {
                      Navigator.pushReplacementNamed(context, '/register_screen');
                    }),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
