import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/View/item_list_view_complete.dart';
import 'package:todoapp/View/item_list_view_incomplete.dart';

import 'package:todoapp/global.dart';

import 'package:todoapp/state_managent/Event/completed_page_event.dart';
import 'package:todoapp/state_managent/State/completed_page_state.dart';

class CompletedPageBloc extends Bloc<CompletedPageEvent, CompletedPageState> {
  CompletedPageBloc(CompletedPageState initialState) : super(initialState) {
    on<CreateItemInCompletedPageEvent>((event, emit) {
      reset();
      emit(CreateItemInCompletedPageState(listViewComplete));
    });
  }
}
