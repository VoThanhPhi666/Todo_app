import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/global.dart';
import 'package:todoapp/state_managent/Bloc/completed_page_bloc.dart';
import 'package:todoapp/state_managent/Bloc/incomplete_page_bloc.dart';
import 'package:todoapp/state_managent/Event/completed_page_event.dart';
import 'package:todoapp/state_managent/Event/incomplete_page_event.dart';

class ItemListView extends StatefulWidget {
  final String nameTask;
  final String dateTimeCreate;
  final GlobalKey<ItemListViewState>? keyy;
  const ItemListView(this.nameTask, this.dateTimeCreate, {this.keyy})
      : super(key: keyy);

  @override
  ItemListViewState createState() => ItemListViewState();
}

class ItemListViewState extends State<ItemListView> {
  late CompletedPageBloc completedPageBloc;
  late IncompletedPageBloc incompletedPageBloc;
  bool isOnTap = false;
  @override
  void initState() {
    incompletedPageBloc = BlocProvider.of(context);
    completedPageBloc = BlocProvider.of(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          subtitle: Text(widget.dateTimeCreate),
          title: Text(widget.nameTask),
          trailing: IconButton(
            icon: !isOnTap
                ? Icon(
                    Icons.check_circle_outline,
                    size: height / 25,
                  )
                : Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: height / 25,
                  ),
            onPressed: () {
              setState(() {
                isOnTap = !isOnTap;
                if (isOnTap == true) {
                  completedPageBloc.add(CreateItemInCompletedPageEvent());
                  incompletedPageBloc.add(CreateItemInIncompletedPageEvent());
                } else {
                  incompletedPageBloc.add(CreateItemInIncompletedPageEvent());
                  completedPageBloc.add(CreateItemInCompletedPageEvent());
                }
              });
            },
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
