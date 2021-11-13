import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/View/item_list_view_incomplete.dart';

import 'package:todoapp/global.dart';

import 'package:todoapp/state_managent/Event/incomplete_page_event.dart';

import 'package:todoapp/state_managent/State/incomplete_page_state.dart';

class IncompletedPageBloc
    extends Bloc<IncompletedPageEvent, IncompletedPageState> {
  IncompletedPageBloc(IncompletedPageState initialState) : super(initialState) {
    on<CreateItemInIncompletedPageEvent>((event, emit) {
      reset();
      emit(CreateItemInIncompletedPageState(listViewIncomplete));
    });
  }
}
