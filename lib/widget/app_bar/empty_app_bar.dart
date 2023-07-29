import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class EmptyAppBar extends AppBar {
  EmptyAppBar({super.key, required BuildContext context})
      : super(
          backgroundColor: AppColors.bottomNavigationBackground,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
}
