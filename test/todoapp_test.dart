import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
//Unit test

  //test class/////////////////////////////////
  test("object itemListViewMainTest should be not null", () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012");
    expect(itemListViewMainTest, isNotNull);
  });
  test("type of object itemListViewMainTest should be ItemListViewMainTest",
      () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012");
    expect(itemListViewMainTest.runtimeType, ItemListViewMainTest);
  });

  //test properties////////////////////////////////
  test("three properties should not be null", () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012");
    expect(itemListViewMainTest.nameTask, isNotNull);
    expect(itemListViewMainTest.dateTimeCreate, isNotNull);
    expect(itemListViewMainTest.isOnTap, isNotNull);
  });
  test("type of properties nameTask and dateTimeCreate should be String", () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012");
    expect(itemListViewMainTest.nameTask.runtimeType, String);
    expect(itemListViewMainTest.dateTimeCreate.runtimeType, String);
  });
  test("type of property isOnTap should be bool", () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012");
    expect(itemListViewMainTest.isOnTap.runtimeType, bool);
  });
  test("initial isOnTap's value of object itemListViewMainTest should be false",
      () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012");
    expect(itemListViewMainTest.isOnTap, false);
  });
  test("nameTask's value of object itemListViewMainTest should be task1", () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012");
    expect(itemListViewMainTest.nameTask, "task1");
  });
  test("dateTimeCreate's value of object itemListViewMainTest should be task1",
      () {
    ItemListViewMainTest itemListViewMainTest =
        ItemListViewMainTest("task1", "12-12-2012  15:30:00");
    expect(itemListViewMainTest.dateTimeCreate, "12-12-2012  15:30:00");
  });
  //test method////////////////////////////////////
  test("value of isOnTap should be change from false to true", () {
    final itemListViewTest = ItemListViewMainTest("di hoc", "12-12-2012");
    itemListViewTest.swapstate();
    expect(itemListViewTest.isOnTap, true);
  });

  //test function///////////////////////////////////
  test(
      "item1, item3 should be added to listViewCompleteTest and\n"
      "item2, item4 should be added to listViewIncompleteTest", () {
    ItemListViewMainTest item1 = ItemListViewMainTest("task1", "12-12-2021");
    ItemListViewMainTest item2 = ItemListViewMainTest("task2", "12-12-2021");
    ItemListViewMainTest item3 = ItemListViewMainTest("task3", "12-12-2021");
    ItemListViewMainTest item4 = ItemListViewMainTest("task4", "12-12-2021");
    listViewMainTest = [
      item1,
      item2,
      item3,
      item4,
    ];
    item1.swapstate();
    item3.swapstate();
    reset();
    expect(listViewCompleteTest.length, 2);
    expect(listViewIncompleteTest.length, 2);
  });
}

List<ItemListViewMainTest> listViewMainTest = [];
List<ItemListViewCompleteTest> listViewCompleteTest = [];
List<ItemListViewIncompleteTest> listViewIncompleteTest = [];

class ItemListViewMainTest {
  String nameTask;
  String dateTimeCreate;
  bool isOnTap = false;
  ItemListViewMainTest(this.nameTask, this.dateTimeCreate);
  void swapstate() {
    isOnTap = !isOnTap;
  }
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

void reset() {
  for (ItemListViewMainTest item in listViewMainTest) {
    if (item.isOnTap == true) {
      listViewCompleteTest
          .add(ItemListViewCompleteTest(item.nameTask, item.dateTimeCreate));
    } else {
      listViewIncompleteTest
          .add(ItemListViewIncompleteTest(item.nameTask, item.dateTimeCreate));
    }
  }
}
