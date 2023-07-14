import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

import '../../../utils/colors.dart';

class BookInfoScreen extends StatefulWidget {
  const BookInfoScreen({super.key});

  @override
  State<BookInfoScreen> createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<BookInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        backgroundColor: AppColors.bottomNavigationBackground,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('Assets/images/Background.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Das Kapital. Kritik der politischen...',
                style: AppTypography.font20white.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('Assets/images/grandpa.png', width: 168, height: 225, fit: BoxFit.cover,),
                  Padding(
                    padding: const EdgeInsets.only(left: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('GOLDEN BOOK', style: AppTypography.font10black),
                        const SizedBox(height: 5,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 256,
                            child: Text(
                                'Das Kapital. Kritik der politischen Ökonomie',
                                style: AppTypography.font10black)),
                        SizedBox(height: 4,),
                        _TextAndDescription(name: 'Author', description: 'Karl Marx',),
                        SizedBox(height: 4,),
                        _TextAndDescription(name: 'Creato', description: 'Sereja',),
                        SizedBox(height: 4,),
                        _TextAndDescription(name: 'Колличество активностей', description: '8-16',),
                        SizedBox(height: 4,),
                        _TextAndDescription(name: 'Возможный доход', description:'10-52',),
                        SizedBox(height: 4,),
                        _TextAndDescription(name: 'Колличество изображений:', description: '13/16',),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextAndDescription extends StatelessWidget {
  const _TextAndDescription({super.key, required this.name, required this.description});

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width:  MediaQuery.of(context).size.width - 256,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTypography.font10blackW400,),
          Text(description, style: AppTypography.font10black.copyWith(fontSize: 13),),
        ],
      ),
    );
  }
}

