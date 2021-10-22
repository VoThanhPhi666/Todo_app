import 'package:todoapp/View/item_list_view_incomplete.dart';

class IncompletedPageState {}

class InitInIncompletedPageState extends IncompletedPageState {}

class CreateItemInIncompletedPageState extends IncompletedPageState {
  CreateItemInIncompletedPageState(this.listItemIncompletedPage);
  List<ItemListViewIncomplete> listItemIncompletedPage = [];
}
