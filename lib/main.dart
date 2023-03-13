import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/component/customFab.dart';
import 'package:task_manager/component/fade_app_bar.dart';
import 'package:task_manager/controller/mark_task_notifier.dart';
import 'package:task_manager/view/floating_search_view.dart';

import 'package:task_manager/view/task_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App Xiaomi',
      theme: ThemeData(
        backgroundColor: Color(0xFFf7f7f7),
        scaffoldBackgroundColor: Color(0xFFf7f7f7),
        primaryColor: Color(0xFFffc000),
        fontFamily: 'Poppins',
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AnimatedCrossFade(
          crossFadeState: CrossFadeState.showFirst,
          duration: Duration(seconds: 1),
          firstChild: FadeAppBar(
            leading: SizedBox.shrink(),
            trailing: PopupMenuButton(
              elevation: 0,
              icon: Icon(
                Icons.more_vert,
                size: 18,
                color: Colors.black,
              ),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              itemBuilder: (ctx) {
                return [
                  PopupMenuItem(
                    value: 0,
                    child: ListTile(
                      selectedTileColor: Color(0xFFf7f7f7),
                      title: Text('Settings'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 0,
                    child: ListTile(
                      selectedTileColor: Color(0xFFf7f7f7),
                      title: Text('Hide completed task'),
                    ),
                  ),
                ];
              },
            ),
          ),
          secondChild: FadeAppBar(
            title: '2 items selected',
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close_rounded,
                size: 18,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.checklist_rounded,
                  size: 18, color: Colors.black),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        GestureDetector(
          onTap: () {},
          child: Center(
            child: Column(
              children: [
                Icon(Icons.delete_outline_rounded),
                Text('Delete', style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
        ),
      ],
      floatingActionButton: CustomFab(),
      body: ChangeNotifierProvider<MarkTaskNotifier>(
        create: (context) => MarkTaskNotifier(),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(delegate: SliverSearchBar(), floating: true),
          ],
          body: TaskView(),
        ),
      ),
    );
  }
}
