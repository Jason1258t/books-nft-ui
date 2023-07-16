import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

class CustomSwitchCategories extends StatefulWidget {
  const CustomSwitchCategories({super.key});

  @override
  State<CustomSwitchCategories> createState() => _CustomSwitchCategoriesState();
}

class _CustomSwitchCategoriesState extends State<CustomSwitchCategories> {
  int active = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: InkWell(
              onTap: () {
                setState(() {
                  active = 0;
                });
              },
              child: Container(
                width: 110,
                height: 87,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(active == 0
                      ? 'Assets/images/activeStoreCategory.png'
                      : 'Assets/images/noActiveStoreCategory.png'),
                )),
                child: SizedBox(
                    width: 60,
                    child: Text(
                      'Recommended',
                      style: AppTypography.font20gold.copyWith(fontSize: 14),
                    )),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90),
          child: InkWell(
              onTap: () {
                setState(() {
                  active = 1;
                });
              },
              child: Container(
                width: 110,
                height: 87,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(active == 1
                      ? 'Assets/images/activeStoreCategory.png'
                      : 'Assets/images/noActiveStoreCategory.png'),
                )),
                child: SizedBox(
                    width: 60,
                    child: Text(
                      'New',
                      style: AppTypography.font20gold.copyWith(fontSize: 14),
                    )),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 180),
          child: InkWell(
              onTap: () {
                setState(() {
                  active = 2;
                });
              },
              child: Container(
                width: 110,
                height: 87,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(active == 2
                      ? 'Assets/images/activeStoreCategory.png'
                      : 'Assets/images/noActiveStoreCategory.png'),
                )),
                child: SizedBox(
                    width: 60,
                    child: Text(
                      'Popular',
                      style: AppTypography.font20gold.copyWith(fontSize: 14),
                    )),
              )),
        ),
      ],
    );
  }
}
