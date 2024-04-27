import 'package:flutter/material.dart';

class CreateRideProvider extends ChangeNotifier {
  final List<String> destinations = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? startPoint;

  void selectedStartPoint(String? point) {
    startPoint = point;
    notifyListeners();
  }

  void selectedEndPoint(String? point) {
    endPoint = point;
    notifyListeners();
  }

  String? endPoint;
}
