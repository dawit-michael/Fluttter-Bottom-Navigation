import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/providerModals/Enums.dart';
// component : BottomNavigationModal
// description : provider modal used to switch between tabs
// includes:
//  ----

class BottomNavigationModal extends ChangeNotifier {
  var _selectedTab = MenuItems.Home;

  // returns index of current selected navigation item

  getIndex() {
    return MenuItems.values.indexOf(_selectedTab);
  }

  // changes the current index to the  selected navigation tab item

  handleIndexChanged(int i) {
    _selectedTab = MenuItems.values[i];
    notifyListeners();
  }
}
