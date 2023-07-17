import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

import '../../../utils/colors.dart';
import '../../../widget/stats/stat.dart';

class CategoryBooksScreen extends StatefulWidget {
  const CategoryBooksScreen({super.key});

  @override
  State<CategoryBooksScreen> createState() => _CategoryBooksScreenState();
}

List<String> list = [
  'Recommended',
  'Price (low to high)',
  'Popular',
];

class _CategoryBooksScreenState extends State<CategoryBooksScreen> {
  String activeValue = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        backgroundColor: AppColors.bottomNavigationBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const UserStat(
                text: 'x1.4', fill: 0, asset: 'Assets/icons/Vector-2.svg'),
            const UserStat(
                text: '3,3/5', fill: 3.3 / 5, asset: 'Assets/icons/energy.svg'),
            const UserStat(
                text: '85%', fill: 0.85, asset: 'Assets/icons/shield.svg'),
          ],
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('Assets/images/Background.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Economy',
                      style: AppTypography.font20gold.copyWith(fontSize: 24),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        menuItemStyleData: const MenuItemStyleData(
                          height: 19,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2)
                        ),
                        dropdownStyleData: DropdownStyleData(
                            elevation: 0,
                            offset: const Offset(0, 10),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  stops: const [0, 0.1, 0.15, 1],
                                  begin: const Alignment(0.00, -1.00),
                                  end: const Alignment(0, 1),
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    const Color(0x824F483D).withOpacity(0.2),
                                    const Color(0xFF4F483D).withOpacity(0.5)
                                  ],
                                ),
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(10)))),
                        customButton: Container(
                          width: 150,
                          height: 36,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.goldBorder, width: 2),
                              borderRadius: BorderRadius.circular(8),
                              gradient: AppGradients.buttonGold),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Apply',
                                style: AppTypography.font20gold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.goldBorder,
                                ),
                              ),
                            ],
                          ),
                        ),
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          bool isActive = value == activeValue;

                          return DropdownMenuItem<String>(
                            alignment: Alignment.topLeft,
                            value: value,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: SvgPicture.asset(
                                    'Assets/icons/point.svg',
                                    color: !isActive
                                        ? AppColors.goldBorder
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  value,
                                  style: !isActive
                                      ? AppTypography.font20gold
                                          .copyWith(fontSize: 14)
                                      : AppTypography.font16white
                                          .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (c) {
                          setState(() {
                            activeValue = c!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 3,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 50,
                    colors: [Color(0xFFFDF2DF), Color(0xFF897F67)],
                  ),
                ),
              ),
              Container(
                  width: width,
                  height: height - 225,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 1.2,
                      colors: [Color(0xffA1A7A3), Color(0xFF6C7970)],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width,
                        height: 2,
                        color: AppColors.lvlText,
                      ),
                      SizedBox(
                        height: 170,
                        child: ListView(
                          children: const [],
                        ),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
