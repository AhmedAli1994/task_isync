import 'package:flutter/cupertino.dart';

class MenuOpens with ChangeNotifier{
  bool isMenuOpen = false;

  void changeStatus (){
    isMenuOpen = !isMenuOpen;
    notifyListeners();
  }
}