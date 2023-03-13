import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTaskView extends StatefulWidget {
  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  int lines = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          16, 0, 16, MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Input task description',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.multiline,
            minLines: lines,
            maxLines: 15,
            onChanged: (value) {
              window.onKeyData = (final keyData) {
                if (keyData.logical == LogicalKeyboardKey.enter.keyId) {
                  if (lines > 15) lines = 15;
                  lines++;

                  return true;
                }
                if (lines < 1) lines = 1;
                lines--;

                return false;
              };
              setState(() {
                lines;
              });
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.timer_outlined),
                onPressed: () {},
                label: Text(
                  'Set reminder',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    // color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE6E6E6),
                    onPrimary: Colors.black,
                    elevation: 0,
                    shape: StadiumBorder()),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Color(0xFFACACAC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
