import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/fonts.dart';

class PincodeScreen extends StatefulWidget {
  const PincodeScreen({super.key, required this.continueFunction});

  final VoidCallback continueFunction;

  @override
  State<PincodeScreen> createState() => _PincodeScreenState();
}

class _PincodeScreenState extends State<PincodeScreen> {
  bool _creating = true;
  String pin = '';
  String pinToVerify = '';

  final String _active = 'Assets/icons/pin_symbol_active.svg';
  final String _notActive = 'Assets/icons/pin_symbol.svg';

  Widget _buildPincodeSymbols() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(pin.length > 0 ? _active : _notActive),
          SvgPicture.asset(pin.length > 1 ? _active : _notActive),
          SvgPicture.asset(pin.length > 2 ? _active : _notActive),
          SvgPicture.asset(pin.length > 3 ? _active : _notActive),
        ],
      );

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
            widget.continueFunction();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    child: _buildPincodeSymbols(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomNumberButton(
                                callback: () {
                                  setNumber('1');
                                },
                                text: '1'),
                            CustomNumberButton(
                                callback: () {
                                  setNumber('2');
                                },
                                text: '2'),
                            CustomNumberButton(
                                callback: () {
                                  setNumber('3');
                                },
                                text: '3'),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomNumberButton(
                                callback: () {
                                  setNumber('4');
                                },
                                text: '4'),
                            CustomNumberButton(
                                callback: () {
                                  setNumber('5');
                                },
                                text: '5'),
                            CustomNumberButton(
                                callback: () {
                                  setNumber('6');
                                },
                                text: '6'),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomNumberButton(
                                callback: () {
                                  setNumber('7');
                                },
                                text: '7'),
                            CustomNumberButton(
                                callback: () {
                                  setNumber('8');
                                },
                                text: '8'),
                            CustomNumberButton(
                                callback: () {
                                  setNumber('9');
                                },
                                text: '9'),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomNumberButton extends StatelessWidget {
  const CustomNumberButton(
      {super.key, required this.callback, required this.text});

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.white,
        onTap: callback,
        child: SizedBox(
          width: 64,
          height: 64,
          child: Center(
            child: Text(text,
                textAlign: TextAlign.center, style: AppTypography.font36w800),
          ),
        ));
  }
}

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callback,
        child: Container(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              'Assets/icons/delete.svg',
              width: 32,
              height: 32,
            )));
  }
}
