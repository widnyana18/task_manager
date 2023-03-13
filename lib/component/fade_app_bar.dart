import 'package:flutter/material.dart';

class FadeAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const FadeAppBar({this.title = 'My Task', this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: leading,
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black,
      ),
      centerTitle: true,
      actions: [trailing!],
    );
  }
}
