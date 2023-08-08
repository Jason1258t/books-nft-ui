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
    final width = MediaQuery.of(context).size.width;

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
            padding: EdgeInsets.only(left: width * 0.22),
            text: 'New',
            active: active == 1,
            callback: () {
              selectTab(1);
            }),
        CustomCategoryButton(
            padding: EdgeInsets.only(left: width * 0.44),
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: padding,
      child: InkWell(
          onTap: callback,
          child: Container(
            width: width * 0.32,
            height: width * 0.22,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 13, bottom: 3, right: 24),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(active
                  ? 'Assets/images/activeStoreCategory.png'
                  : 'Assets/images/noActiveStoreCategory.png'),
            )),
            child: Container(
              width: 60,
              alignment: Alignment.center,
              child: StrokeText(
                strokeColor: active
                    ? AppColors.isActiveStrokeText
                    : AppColors.isNoActiveStrokeText,
                strokeWidth: 2.5,
                textStyle: active
                    ? AppTypography.font14white
                    : AppTypography.font20gold.copyWith(fontSize: 14),
                text: text,
              ),
            ),
          )),
    );
  }
}
