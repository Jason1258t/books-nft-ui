import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/fonts.dart';
import '../../../widget/app_bar/app_bar.dart';
import '../../../widget/buttons/keyboard/delete_button.dart';
import '../../../widget/buttons/keyboard/number_button.dart';
import '../../../widget/custom_scaffold/scaffold.dart';

class PINScreen extends StatefulWidget {
  const PINScreen({super.key});

  @override
  State<PINScreen> createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {
  bool _creating = true;
  String pin = '';
  String pinToVerify = '';

  final String _active = 'Assets/icons/pin_symbol_active.svg';
  final String _notActive = 'Assets/icons/pin_symbol.svg';

  Widget _buildPINSymbols() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(pin.isNotEmpty ? _active : _notActive),
          SvgPicture.asset(pin.length > 1 ? _active : _notActive),
          SvgPicture.asset(pin.length > 2 ? _active : _notActive),
          SvgPicture.asset(pin.length > 3 ? _active : _notActive),
        ],
      );



  @override
  Widget build(BuildContext context) {
    void continueFunction() => Navigator.pushNamed(context, '/phrase_screen');

    void setNumber(String n) async {
      setState(() {
        if (pin.length < 4) {
          pin += n;
        }
      });

      if (pin.length == 4) {
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          if (_creating) {
            _creating = false;
            pinToVerify = pin;
            pin = '';
          } else {
            if (pin == pinToVerify) {
              continueFunction();
            } else {
              pin = '';
              pinToVerify = '';
              _creating = true;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Pin is wrong. Please try again!')));
            }
          }
        });
      }
    }

    void delete() {
      setState(() {
        if (pin.isNotEmpty) {
          pin = pin.substring(0, pin.length - 1);
        }
      });
    }

    Column _buildKeyboard() {
      List<Widget> children = [];

      for (int i = 0; i < 3; i++) {
        List<Widget> rowChildren = [];
        for (int j = 1; j < 4; j++) {
          rowChildren.add(CustomNumberButton(
              callback: () {
                setNumber('${j + i * 3}');
              },
              text: '${j + i * 3}'));
        }
        children.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ));
        children.add(const SizedBox(
          height: 32,
        ));
      }
      children.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 64,
          ),
          CustomNumberButton(
              callback: () {
                setNumber('0');
              },
              text: '0'),
          CustomDeleteButton(callback: delete),
        ],
      ));

      return Column(children: children);
    }
    
    return CustomScaffold(
      appBar: CustomAppBar(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        context: context,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(_creating ? 'Create PIN' : 'Confirm PIN',
                  style: AppTypography.font24w700Gilroy),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: _buildPINSymbols(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: _buildKeyboard(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}