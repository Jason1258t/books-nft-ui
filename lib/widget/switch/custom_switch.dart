import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

List<bool> isSelected = [false, false];
int selectIndex = 0;

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ToggleButtons(
      borderColor: AppColors.goldBorder,
      borderWidth: 2,
      borderRadius: BorderRadius.circular(10),
      selectedBorderColor: AppColors.goldBorder,
      isSelected: isSelected,
      splashColor: AppColors.isActiveSwitchToggle,
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
              selectIndex = index;
              setState(() {});
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
      children: [
        Container(
          width: (width - 40) / 2,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              selectIndex == 0
                  ? const Color(0xffE1CFAB)
                  : AppColors.buttonLightColor,
              selectIndex == 0
                  ? AppColors.isActiveSwitchToggle
                  : AppColors.isNoActiveSwitchToggle,
            ], radius: 1, center: Alignment.topCenter),
          ),
          child: Text('Books',
              style: selectIndex == 0
                  ? AppTypography.font24goldShadow
                  : AppTypography.font24darkShadow),
        ),
        Container(
          width: (width - 40) / 2,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              selectIndex == 1
                  ? const Color(0xffE1CFAB)
                  : AppColors.buttonLightColor,
              selectIndex == 1
                  ? AppColors.isActiveSwitchToggle
                  : AppColors.isNoActiveSwitchToggle,
            ], radius: 1, center: Alignment.topCenter),
            color: selectIndex == 1
                ? AppColors.isActiveSwitchToggle
                : AppColors.isNoActiveSwitchToggle,
          ),
          child: Text('Collections',
              style: selectIndex == 1
                  ? AppTypography.font24goldShadow
                  : AppTypography.font24darkShadow),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../utils/colors.dart';
// import '../containers/books_container.dart';
//
// List<int> list = [1, 2, 34, 4, 5, 6, 7, 8, 8, 9];
//
// class TabBarExample extends StatefulWidget {
//   const TabBarExample({super.key});
//
//   @override
//   State<TabBarExample> createState() => _TabBarExampleState();
// }
//
// class _TabBarExampleState extends State<TabBarExample>
//     with TickerProviderStateMixin {
//   late final TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 55,
//           width: MediaQuery.of(context).size.width - 40,
//           padding: EdgeInsets.zero,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.0),
//               color: AppColors.isNoActiveSwitchToggle),
//           child: TabBar(
//             indicatorSize: TabBarIndicatorSize.tab,
//             controller: _tabController,
//             indicator: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               gradient: const RadialGradient(colors: [
//                 const Color(0xffE1CFAB),
//                 AppColors.isActiveSwitchToggle,
//               ], radius: 1, center: Alignment.topCenter),
//               color: AppColors.isActiveSwitchToggle,
//             ),
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white70,
//             tabs: <Widget>[
//               SizedBox(
//                 height: 55,
//                 child: const Text(
//                   "Coins",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//               ),
//               SizedBox(
//                 width: (MediaQuery.of(context).size.width - 40) / 2,
//                 height: 55,
//                 child: const Text(
//                   "Finance",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           height: list.length * (MediaQuery.of(context).size.width * 0.55 + 55),
//           child: TabBarView(
//             controller: _tabController,
//             children: <Widget>[
//               Column(
//                 children: list.map((e) => const BooksContainer()).toList(),
//               ),
//               Container(
//                 width: 200,
//                 height: 300,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
