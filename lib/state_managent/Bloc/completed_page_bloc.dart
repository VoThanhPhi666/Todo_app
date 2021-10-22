import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/View/item_list_view_complete.dart';

import 'package:todoapp/global.dart';

import 'package:todoapp/state_managent/Event/completed_page_event.dart';
import 'package:todoapp/state_managent/State/completed_page_state.dart';

class CompletedPageBloc extends Bloc<CompletedPageEvent, CompletedPageState> {
  CompletedPageBloc(CompletedPageState initialState) : super(initialState) {
    on<CreateItemInCompletedPageEvent>((event, emit) {
      listViewComplete = [];
      for (var element in listViewMain) {
        if (element.keyy!.currentState!.isOnTap == true) {
          listViewComplete.add(
              ItemListViewComplete(element.nameTask, element.dateTimeCreate));
        }
      }
      emit(CreateItemInCompletedPageState(listViewComplete));
    });
  }
}
