import 'package:flutter/foundation.dart';
import 'package:myteethpractice/dummy/carasoul_data.dart';

class CarasoulDataNotifier extends ChangeNotifier {
  List<carasouldata> _carasoulList = [];

  List<carasouldata> get carasoulList => _carasoulList;

  void addData(carasouldata newData) {
    _carasoulList.add(newData);
    notifyListeners();
  }
}

