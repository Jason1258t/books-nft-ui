import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../utils/colors.dart';

class CustomSwitchCategories extends StatefulWidget {
  const CustomSwitchCategories({super.key});

  @override
  State<CustomSwitchCategories> createState() => _CustomSwitchCategoriesState();
}

class _CustomSwitchCategoriesState extends State<CustomSwitchCategories> {
  int active = 0;

  void selectTab(int ind) => setState(() {
        active = ind;
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCategoryButton(
            padding: const EdgeInsets.only(left: 0),
            text: 'Recommended',
            active: active == 0,
            callback: () {
              selectTab(0);
            }),
        CustomCategoryButton(
            padding: const EdgeInsets.only(left: 75),
            text: 'New',
            active: active == 1,
            callback: () {
              selectTab(1);
            }),
        CustomCategoryButton(
            padding: const EdgeInsets.only(left: 150),
            text: 'Popular',
            active: active == 2,
            callback: () {
              selectTab(2);
            }),
      ],
    );
  }
}

class CustomCategoryButton extends StatelessWidget {
  const CustomCategoryButton(
      {super.key,
      required this.padding,
      required this.text,
      required this.active,
      required this.callback});

  final EdgeInsets padding;
  final String text;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
          onTap: callback,
          child: Container(
            width: 92,
            height: 70,
            padding: const EdgeInsets.only(left: 13, bottom: 3, right: 24),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(active
                  ? 'Assets/images/activeStoreCategory.png'
                  : 'Assets/images/noActiveStoreCategory.png'),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StrokeText(
                  strokeColor: active ? AppColors.isActiveStrokeText : AppColors.isNoActiveStrokeText,
                  strokeWidth: 2.5,
                  textStyle: active
                      ? AppTypography.font14white
                      : AppTypography.font20gold.copyWith(fontSize: 14),
                  text: text,
                )
              ],
            ),
          )),
    );
  }
}
