import 'package:todoapp/View/item_list_view.dart';

class HomePageEvent {}

class CreateItemInHomePageEvent extends HomePageEvent {
  ItemListView data;
  CreateItemInHomePageEvent(this.data);
}
