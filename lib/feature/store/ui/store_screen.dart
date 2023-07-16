import 'package:flutter/material.dart';

import '../../../widget/custom_scrollers/custom_category_scroller.dart';
import '../../../widget/switch/custom_switch_categories.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSwitchCategories(),
              SizedBox(height: 20,),
              CustomCategoryScroller(title: 'Economy',),
              CustomCategoryScroller(title: 'Fantasy',),
              CustomCategoryScroller(title: 'Romantic',),
            ],
          ),
        ),
      ),
    );
  }
}
