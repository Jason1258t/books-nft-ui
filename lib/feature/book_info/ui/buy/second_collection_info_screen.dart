import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/book_info/bloc/book_detail/book_detail_cubit.dart';
import 'package:nft/feature/book_info/bloc/collection_detail/collection_detail_cubit.dart';
import 'package:nft/feature/book_info/bloc/collection_detail/collection_detail_state.dart';
import 'package:nft/feature/book_info/data/book_info_repository.dart';
import 'package:nft/feature/store/data/store_repository.dart';
import 'package:nft/widget/custom_scaffold/custom_scaffold.dart';

import '../../../../utils/fonts.dart';
import '../../../../widget/app_bar/app_bar.dart';

class SecondCollectionDetailScreen extends StatelessWidget {
  const SecondCollectionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final int collectionId = arguments['collection_id'];
    final String name = arguments['name'];

    final storeRepository =
    RepositoryProvider.of<StoreRepository>(context);

    storeRepository.getCollectionDetailById(collectionId);

    return BlocBuilder<CollectionDetailCubit, CollectionDetailState>(
      builder: (context, state) {
        if (state is CollectionDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CollectionDetailFail) {
          return Text('проблем');
        } else {
          final details = RepositoryProvider.of<StoreRepository>(context)
              .currentCollectionDetails!;

          return CustomScaffold(
            appBar: CustomAppBar(
              width: width,
              height: height,
              context: context,
            ),
            isButtonBack: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  name,
                  style: AppTypography.font20white.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('DESCRIPTION',
                    style: AppTypography.font10black.copyWith(fontSize: 24)),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  details.description,
                  style: AppTypography.font10blackW400
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('DETAILS',
                    style: AppTypography.font10black.copyWith(fontSize: 24)),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'ISBN: ${details.ISBN} \nДата публикации: ${details.createAt} \nЯзык: ${details.language} \nЖанр: ${details.genre} \nКоличество страниц: ${details.pagesCount} \nАдрес контракта: ${details.contractAddress}',
                  style: AppTypography.font10blackW400.copyWith(
                      fontSize: 12, height: 2, fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          );
        }
      },
    );
  }
}
