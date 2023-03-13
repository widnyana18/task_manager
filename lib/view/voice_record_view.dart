import 'package:flutter/material.dart';

class VoiceRecordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('06.00', style: TextStyle(color: Color(0xFFffc000))),
          SizedBox(height: 20),
          Expanded(
            child: Container(color: Color(0xFFffc000)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFffc000),
              elevation: 0,
              shape: StadiumBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
