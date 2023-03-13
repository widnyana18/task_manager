import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/component/task_tile.dart';
import 'package:task_manager/controller/mark_task_notifier.dart';

class SliverSearchBar extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 0;

  @override
  double get maxExtent => 45;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var searchBar = ListTile(
      dense: true,
      tileColor: Color(0xFFE6E6E6),
      leading: Icon(Icons.search_sharp),
      title: Text('Looking for work'),
      shape: StadiumBorder(),
      iconColor: Colors.grey,
      textColor: Colors.grey,
      onTap: () {
        showSearch(
          context: context,
          delegate: TaskSearchView(),
        );
      },
    );

    return SizedBox.expand(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: shrinkOffset == maxExtent ? SizedBox.shrink() : searchBar,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverSearchBar oldDelegate) => false;
}

class TaskSearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.cancel_rounded),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_rounded),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(seconds: 1),
      firstChild: Center(
        child: Text('Task not found'),
      ),
      secondChild: ChangeNotifierProvider<MarkTaskNotifier>.value(
        value: MarkTaskNotifier(),
        child: ListView.builder(
          itemCount: 3,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: TaskTile(dataIdx: 0),
            );
          },
        ),
      ),
      crossFadeState: CrossFadeState.showFirst,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ChangeNotifierProvider<MarkTaskNotifier>.value(
      value: MarkTaskNotifier(),
      child: ListView.builder(
        itemCount: 1,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 9),
            child: TaskTile(dataIdx: 2),
          );
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      ),
      inputDecorationTheme: searchFieldDecorationTheme,
    );
  }

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        filled: true,
        constraints: BoxConstraints.tight(Size.fromHeight(40)),
        fillColor: Color(0xFFE6E6E6),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        prefixIconColor: Colors.grey,
      );
}
