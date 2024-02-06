part of 'shelf.dart';

class LockedShelf extends StatelessWidget {
  const LockedShelf({super.key});

  _buyShelf(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        builder: (BuildContext context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: PurchaseBottomSheet(
              price: 1,
              title: 'New shelf',
              purchaseCallback: () {
                BlocProvider.of<PurchaseCubit>(context)
                    .buyShelf();
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  offset: Offset.zero, blurRadius: 20, color: Colors.black54)
            ]),
      ),
      Container(
        alignment: Alignment.topRight,
        child: Image.asset(
          'Assets/images/locked_shelf_counter.png',
          width: 58,
        ),
      ),
      Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RowElevatedButton(
                text: 'Buy',
                onTap: () {
                  _buyShelf(context);
                },
                asset1: 'Assets/icons/shopping-bag.svg',
                gradient: AppGradients.wardrobeButtons,
                width: 150,
                height: 56,
              ),
              const SizedBox(height: 5,),
              Text(
                'Open a new shelf for \$ free CLC',
                textAlign: TextAlign.center,
                style: AppTypography.font10white
              )
            ],
          )),
    ]);
  }
}