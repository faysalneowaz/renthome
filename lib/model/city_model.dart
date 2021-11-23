import 'package:flutter/material.dart';

class SingleSelectCountry with ChangeNotifier {
  final List<String> _items = [
    "Argentina",
    "Belgium",
    "Brazil",
    "Denmark",
    "England"
  ];

  String _selectedItem = "Argentina";

  List<String> get items {
    return _items;
  }

  String get selected {
    return _selectedItem;
  }

  set selected(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
