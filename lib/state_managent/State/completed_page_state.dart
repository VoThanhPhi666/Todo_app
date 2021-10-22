import 'package:todoapp/View/item_list_view_complete.dart';

class CompletedPageState {}

class InitInCompletedPageState extends CompletedPageState {}

class CreateItemInCompletedPageState extends CompletedPageState {
  CreateItemInCompletedPageState(this.listItemCompletedPage);
  List<ItemListViewComplete> listItemCompletedPage = [];
}
