import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todoapp/global.dart';
import 'package:todoapp/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final addButton = find.byKey(const Key("addButtonKey"));
  final textField = find.byKey(const Key("textFieldKey"));
  final createButton = find.byKey(const Key("createButtonKey"));
  final checkBox = find.byKey(const Key("checkBoxKey"));
  // auto add 6 tasks into main screen
  // auto check on check box of tasks: 1,3,5
  // check if the 2 sub screens have updated the tasks

  testWidgets("test full app", (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    await tester.enterText(textField, "Đi học thêm");
    await tester.pumpAndSettle();
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    await tester.enterText(textField, "Đi làm thêm");
    await tester.pumpAndSettle();
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    await tester.enterText(textField, "Làm đồ án");
    await tester.pumpAndSettle();
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    await tester.enterText(textField, "Làm báo cáo");
    await tester.pumpAndSettle();
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    await tester.enterText(textField, "Chạy dealine Công Nghệ PM");
    await tester.pumpAndSettle();
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    await tester.enterText(textField, "Đèo ghệ đi bay");
    await tester.pumpAndSettle();
    await tester.tap(createButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(checkBox.at(0));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(checkBox.at(2));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(checkBox.at(4));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.tap(find.byIcon(Icons.home));
    expect(listViewMain.length, 6);
    expect(listViewComplete.length, 3);
    expect(listViewIncomplete.length, 3);
    expect(listViewMain[0].nameTask, listViewComplete[0].nameTask);
    expect(listViewMain[0].dateTimeCreate, listViewComplete[0].dateTimeCreate);
    expect(listViewMain[2].nameTask, listViewComplete[1].nameTask);
    expect(listViewMain[2].dateTimeCreate, listViewComplete[1].dateTimeCreate);
    expect(listViewMain[4].nameTask, listViewComplete[2].nameTask);
    expect(listViewMain[4].dateTimeCreate, listViewComplete[2].dateTimeCreate);
    expect(listViewMain[1].nameTask, listViewIncomplete[0].nameTask);
    expect(
        listViewMain[1].dateTimeCreate, listViewIncomplete[0].dateTimeCreate);
    expect(listViewMain[3].nameTask, listViewIncomplete[1].nameTask);
    expect(
        listViewMain[3].dateTimeCreate, listViewIncomplete[1].dateTimeCreate);
    expect(listViewMain[5].nameTask, listViewIncomplete[2].nameTask);
    expect(
        listViewMain[5].dateTimeCreate, listViewIncomplete[2].dateTimeCreate);

    await tester.pumpAndSettle(const Duration(seconds: 6));
  });
}
