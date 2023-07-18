import 'package:flutter/cupertino.dart';

class HomeRepository{
  bool isSecondScreen = true;
  bool showBottomSheet = false;

  void setIsSecondScreen(bool f) => isSecondScreen = f;
}