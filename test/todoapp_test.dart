import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test("Add item to ListViewMain", () {
    List<ItemListViewTest> listViewMain = [];
    listViewMain.add(ItemListViewTest("di hoc",
        DateFormat("dd-MM-yyyy   hh:mm").format(DateTime.now()), false));
    expect(listViewMain.length, 1);
    print("pass1");
  });
  test("add item to ListViewComplete", () {
    List<ItemListViewTest> listViewMain = [
      ItemListViewTest("di hoc",
          DateFormat("dd-MM-yyyy   hh:mm").format(DateTime.now()), true)
    ];
    List<ItemListViewCompleteTest> listViewComplete = [];
    for (var item in listViewMain) {
      if (item.isOnTap == true) {
        listViewComplete
            .add(ItemListViewCompleteTest(item.nameTask, item.dateTimeCreate));
      }
    }
    expect(listViewComplete.length, 1);
    print("pass2");
  });

  test("add item to ListViewIncomplete", () {
    List<ItemListViewTest> listViewMain = [
      ItemListViewTest("di hoc",
          DateFormat("dd-MM-yyyy   hh:mm").format(DateTime.now()), false)
    ];
    List<ItemListViewIncompleteTest> listViewIncomplete = [];
    for (var item in listViewMain) {
      if (item.isOnTap == false) {
        listViewIncomplete.add(
            ItemListViewIncompleteTest(item.nameTask, item.dateTimeCreate));
      }
    }
    expect(listViewIncomplete.length, 1);
    print("pass3");
  });
}

class ItemListViewTest {
  String nameTask;
  String dateTimeCreate;
  bool isOnTap;
  ItemListViewTest(this.nameTask, this.dateTimeCreate, this.isOnTap);
}

class ItemListViewCompleteTest {
  String nameTask;
  String dateTimeCreate;
  ItemListViewCompleteTest(this.nameTask, this.dateTimeCreate);
}

class ItemListViewIncompleteTest {
  String nameTask;
  String dateTimeCreate;
  ItemListViewIncompleteTest(this.nameTask, this.dateTimeCreate);
}
