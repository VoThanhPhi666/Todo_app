import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/global.dart';

import 'package:todoapp/state_managent/Bloc/incomplete_page_bloc.dart';

import 'package:todoapp/state_managent/State/incomplete_page_state.dart';

class IncompletePage extends StatefulWidget {
  const IncompletePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => IncompletePageState();
}

class IncompletePageState extends State<IncompletePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncompletedPageBloc, IncompletedPageState>(
        builder: (context, state) {
      if (state is InitInIncompletedPageState) {
        return Center(
          child: Text(
            "...",
            style: TextStyle(fontSize: height / 20),
          ),
        );
      }
      if (state is CreateItemInIncompletedPageState) {
        if (state.listItemIncompletedPage.isEmpty) {
          return Center(
            child: Text(
              "...",
              style: TextStyle(fontSize: height / 20),
            ),
          );
        }
        return ListView.builder(
            itemCount: state.listItemIncompletedPage.length,
            itemBuilder: (context, index) {
              return state.listItemIncompletedPage[index];
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
