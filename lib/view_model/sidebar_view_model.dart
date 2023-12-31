import 'package:flutter/material.dart';

import '../view/home_screen/home_screen.dart';

class SideBarViewModel extends ChangeNotifier {
  int _index = 1;

  int get index => _index;

  final Color _bgColor = Colors.white;
  final Color _color = Colors.white;
  Widget _currentPage = HomeScreen();
  Widget get currentPage => _currentPage;

  get bgColor => _bgColor;
  get color => _color;

  void setChangeScreen(int index) {
    _index = index;
    notifyListeners();
  }

  void setCurrentPage(Widget currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
