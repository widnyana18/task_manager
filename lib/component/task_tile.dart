import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controller/mark_task_notifier.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key, this.dataIdx});
  final int? dataIdx;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  int get idx => widget.dataIdx!;
  @override
  Widget build(BuildContext context) {
    var data = context.watch<MarkTaskNotifier>().data;
    return Padding(
      key: widget.key,
      padding: EdgeInsets.fromLTRB(0, 9, 18, 9),
      child: Container(
        padding: const EdgeInsets.only(left: 18),
        clipBehavior: Clip.hardEdge,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
          ),
        ),
        child: Slidable(
          endActionPane: ActionPane(
            extentRatio: .3,
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(12)),
                onPressed: (ctx) {},
                backgroundColor: Color(0xFFE2244D),
                foregroundColor: Colors.white,
                icon: Icons.delete_outline_rounded,
              ),
            ],
          ),
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFd4d4d4), width: .3),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            ),
            child: ListTile(
              onLongPress: () {},
              onTap: () {},
              tileColor: Colors.white,
              leading: AnimatedCrossFade(
                crossFadeState: CrossFadeState.showFirst,
                duration: Duration(seconds: 1),
                firstChild: Checkbox(
                  activeColor: Color(0xFFd4d4d4),
                  fillColor: MaterialStateProperty.all(Color(0xFFf5f5f5)),
                  side: BorderSide(color: Color(0xFFd4d4d4), width: .5),
                  value: data[idx].isChecked,
                  onChanged: (val) {
                    context
                        .read<MarkTaskNotifier>()
                        .toggleCheck(widget.dataIdx!, val!);
                  },
                ),
                secondChild: IconButton(
                  icon: Icon(Icons.menu_rounded),
                  color: Color(0xFFf5f5f5),
                  iconSize: 20,
                  onPressed: () {},
                ),
              ),
              title: Text(
                data[idx].desc!,
                style: data[idx].isChecked
                    ? TextStyle(
                        color: Color(0xFFd4d4d4),
                        decoration: TextDecoration.lineThrough)
                    : TextStyle(color: Colors.black),
              ),
              dense: true,
              minVerticalPadding: 14,
              trailing: AnimatedCrossFade(
                crossFadeState: CrossFadeState.showFirst,
                duration: Duration(seconds: 1),
                firstChild: SizedBox.shrink(),
                secondChild: Checkbox(
                  activeColor: Color(0xFFffc000),
                  fillColor: MaterialStateProperty.all(Color(0xFFf5f5f5)),
                  shape: CircleBorder(),
                  side: BorderSide(color: Color(0xFFd4d4d4), width: .5),
                  value: false,
                  onChanged: (val) {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
