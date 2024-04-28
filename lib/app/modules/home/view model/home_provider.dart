import 'dart:developer';

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  // selecting between 3 containers start

  SelectedContainer _selectedContainer = SelectedContainer.all;

  SelectedContainer get selectedContainer => _selectedContainer;

  void updateSelectedContainer(SelectedContainer newContainer) {
    _selectedContainer = newContainer;
    notifyListeners();
  }

  bool isFilterShow = true;

  removeFilter() {
    isFilterShow = !isFilterShow;
    log("isFilterShow $isFilterShow");
    notifyListeners();
  }

  // selecting between 3 containers end
}

enum SelectedContainer { all, myRide }
