import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/home.dart';
import 'package:todoapp/state_managent/Bloc/completed_page_bloc.dart';
import 'package:todoapp/state_managent/Bloc/home_bloc.dart';
import 'package:todoapp/state_managent/Bloc/incomplete_page_bloc.dart';

import 'package:todoapp/state_managent/State/completed_page_state.dart';

import 'package:todoapp/state_managent/State/home_state.dart';
import 'package:todoapp/state_managent/State/incomplete_page_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider<CompletedPageBloc>(
          create: (context) => CompletedPageBloc(InitInCompletedPageState()),
        ),
        BlocProvider(create: (context) => HomeBloc(InitInHomeState())),
        BlocProvider(
          create: (context) =>
              IncompletedPageBloc(InitInIncompletedPageState()),
          child: const HomeScreen(),
        )
      ], child: const HomeScreen()),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
