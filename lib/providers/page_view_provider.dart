import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  bool _allPagesViewed = false;
  bool get allPagesViewed => _allPagesViewed;

  void markAllPagesAsViewed() {
    _allPagesViewed = true;
    notifyListeners();
  }
}