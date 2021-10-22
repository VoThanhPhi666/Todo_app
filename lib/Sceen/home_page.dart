import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/global.dart';

import 'package:todoapp/state_managent/Bloc/home_bloc.dart';
import 'package:todoapp/state_managent/Bloc/incomplete_page_bloc.dart';

import 'package:todoapp/state_managent/State/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({GlobalKey? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  late IncompletedPageBloc incompletedBloc;
  @override
  void initState() {
    incompletedBloc = BlocProvider.of(context);

    homeBloc = BlocProvider.of(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is InitInHomeState) {
          return Center(
            child: Text(
              "...",
              style: TextStyle(fontSize: height / 20),
            ),
          );
        }

        if (state is CreateItemInHomeState) {
          return ListView.builder(
              itemCount: state.listItemHomePage.length,
              itemBuilder: (context, index) {
                return state.listItemHomePage[index];
              });
        }
        return Center(
          child: Text(
            "NonState",
            style: TextStyle(fontSize: height / 20),
          ),
        );
      },
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
