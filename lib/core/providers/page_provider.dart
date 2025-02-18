
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {

  PageController _pageController = PageController(initialPage: 0);

  PageController get pageController => _pageController;

  set pageController(PageController value) {
    _pageController = value;
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    print("index $index");
    _currentIndex = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }
}
