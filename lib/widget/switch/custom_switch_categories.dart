import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

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
            padding: const EdgeInsets.only(left: 90),
            text: 'New',
            active: active == 1,
            callback: () {
              selectTab(1);
            }),
        CustomCategoryButton(
            padding: const EdgeInsets.only(left: 180),
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
            width: 110,
            height: 87,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(active
                  ? 'Assets/images/activeStoreCategory.png'
                  : 'Assets/images/noActiveStoreCategory.png'),
            )),
            child: SizedBox(
                width: 60,
                child: Text(
                  text,
                  style: AppTypography.font20gold.copyWith(fontSize: 14),
                )),
          )),
    );
  }
}
