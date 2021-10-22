import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/global.dart';

import 'package:todoapp/state_managent/Event/home_event.dart';
import 'package:todoapp/state_managent/State/home_state.dart';

class HomeBloc extends Bloc<HomePageEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<CreateItemInHomePageEvent>((event, emit) {
      listViewMain.add(event.data);
      emit(CreateItemInHomeState(listViewMain));
    });
  }
}
