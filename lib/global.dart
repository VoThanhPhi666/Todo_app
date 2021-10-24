import 'package:flutter/material.dart';

import 'package:todoapp/Sceen/completed_page.dart';
import 'package:todoapp/Sceen/home_page.dart';
import 'package:todoapp/Sceen/incomplete_page.dart';
import 'package:todoapp/View/item_list_view_complete.dart';
import 'package:todoapp/View/item_list_view_incomplete.dart';

import 'package:todoapp/View/item_list_view.dart';

List<BottomNavigationBarItem> listPageIcon = const [
  BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: "Complete", icon: Icon(Icons.check)),
  BottomNavigationBarItem(label: "Incomplete", icon: Icon(Icons.access_time))
];
List<Widget> listPage = [
  const HomePage(),
  const CompletePage(),
  const IncompletePage()
];
double width =
    MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
double height =
    MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;

List<ItemListView> listViewMain = [];
List<ItemListViewComplete> listViewComplete = [];
List<ItemListViewIncomplete> listViewIncomplete = [];
