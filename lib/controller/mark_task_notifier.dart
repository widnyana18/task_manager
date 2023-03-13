import 'package:flutter/foundation.dart';
import 'package:task_manager/db/task_db.dart';

class MarkTaskNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  List<Task> get data => initData;

  void toggleCheck(int idx, bool val) {
    initData[idx].isChecked = val;

    var curVal = initData.removeAt(idx);
    if (curVal.isChecked) {
      initData.insert(initData.length, curVal);
    } else {
      initData.insert(0, curVal);
    }
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Task>('currentData', data));
  }
}
