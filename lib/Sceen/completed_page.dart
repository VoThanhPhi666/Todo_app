import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/global.dart';
import 'package:todoapp/state_managent/Bloc/completed_page_bloc.dart';
import 'package:todoapp/state_managent/State/completed_page_state.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CompletePageState();
}

class CompletePageState extends State<CompletePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedPageBloc, CompletedPageState>(
        builder: (context, state) {
      if (state is InitInCompletedPageState) {
        return Center(
          child: Text(
            "...",
            style: TextStyle(fontSize: height / 20),
          ),
        );
      }
      if (state is CreateItemInCompletedPageState) {
        if (state.listItemCompletedPage.isEmpty) {
          return Center(
            child: Text(
              "...",
              style: TextStyle(fontSize: height / 20),
            ),
          );
        }
        return ListView.builder(
            itemCount: state.listItemCompletedPage.length,
            itemBuilder: (context, index) {
              return state.listItemCompletedPage[index];
            });
      }
      return Center(
        child: Text(
          "NonState",
          style: TextStyle(fontSize: height / 20),
        ),
      );
    });
    // TODO: implement build
    throw UnimplementedError();
  }
}
