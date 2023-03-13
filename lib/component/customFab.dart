import 'package:flutter/material.dart';
import 'package:task_manager/view/create_task_view.dart';
import 'package:task_manager/view/voice_record_view.dart';

class CustomFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              builder: (context) => VoiceRecordView(),
              constraints: BoxConstraints.tight(
                Size.fromHeight(MediaQuery.of(context).size.height * .22),
              ),
              enableDrag: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            );
          },
          backgroundColor: Color(0xFFffc000),
          child: Icon(Icons.multitrack_audio_rounded),
          elevation: 0,
        ),
        SizedBox(width: 35),
        FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) => IntrinsicHeight(child: CreateTaskView()),
              enableDrag: false,
            );
          },
          backgroundColor: Color(0xFFffc000),
          child: Icon(Icons.add_rounded),
          elevation: 0,
        ),
      ],
    );
  }
}
