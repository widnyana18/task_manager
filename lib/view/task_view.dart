import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/component/task_tile.dart';
import 'package:task_manager/controller/mark_task_notifier.dart';
import 'package:task_manager/db/task_db.dart';

class TaskView extends StatefulWidget {
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      Task row = initData.removeAt(oldIndex);
      initData.insert(newIndex, row);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MarkTaskNotifier>.value(
      value: MarkTaskNotifier(),
      child: ReorderableListView(
        padding: EdgeInsets.symmetric(vertical: 12),
        physics: BouncingScrollPhysics(),
        children: List.generate(
          6,
          (idx) => TaskTile(key: ValueKey(idx), dataIdx: idx),
        ),
        onReorder: _onReorder,
      ),
    );
  }
}
