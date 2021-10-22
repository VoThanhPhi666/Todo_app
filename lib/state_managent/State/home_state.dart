import 'package:todoapp/View/item_list_view.dart';

class HomeState {}

class InitInHomeState extends HomeState {}

class CreateItemInHomeState extends HomeState {
  CreateItemInHomeState(this.listItemHomePage);
  List<ItemListView> listItemHomePage = [];
}
