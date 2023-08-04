import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/store/data/store_repository.dart';
import 'package:nft/models/collection.dart';

import '../../../widget/custom_scrollers/custom_category_scroller.dart';
import '../../../widget/switch/custom_switch_categories.dart';
import '../bloc/store_cubit.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final storeRepository = RepositoryProvider.of<StoreRepository>(context);

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
              const CustomSwitchCategories(),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  if (state is StoreSuccessState) {
                    return Column(
                      children: storeRepository.sortedCollections
                          .map((e) => CustomCategoryScroller(
                                genre: e,
                              ))
                          .toList(),
                    );
                  } else if (state is StoreLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Text('Проблемс с инетом');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
