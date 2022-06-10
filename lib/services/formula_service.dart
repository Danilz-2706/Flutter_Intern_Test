import 'package:flutter/cupertino.dart';
import 'package:test/models/log.dart';

class FormulaService extends ChangeNotifier {
  int _sum = 0;
  int get sum => _sum;
  set sum(int value) {
    _sum = value;
    notifyListeners();
  }

  final List<Log> _items = [];

  List<Log> get items => _items;

  void addItem(Log item) {
    _items.add(item);
    notifyListeners();
  }
}
