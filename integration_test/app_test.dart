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

  testWidgets("Todo application is tested automatically by integration test",
      (tester) async {
    await tester.pumpWidget(const MyApp());
    //Integration test:
    //+ Lần lượt tự động kiểm thử phần mềm bằng các sự kiện đầu vào trên 1 luồng
    // duy nhất:
    // - thêm 6 task ở main screen
    // - kiểm tra complete screen, incomplete screen
    // - quay lại main screen
    // - chạm vào checkbox của các task thứ 1 3 5
    // - kiểm tra lại complete screen và incomplete screen đã được cập nhật giá trị chưa.
    //+ Kiểm thử các Class dùng để phản hồi lại sự kiện đầu vào:
    //-class ItemListView
    //-class ItemListViewComplete
    //-class ItemListViewIncomplete
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
    await tester.pumpAndSettle(const Duration(seconds: 4));
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle(const Duration(seconds: 4));
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(checkBox.at(0));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(checkBox.at(2));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(checkBox.at(4));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.tap(find.byIcon(Icons.home));
    //kiem tra 6 task đã dc thêm vào main screen chưa
    expect(listViewMain.length, 6);
    //kiem tra check box của các task thứ 1 3 5 đã được check chưa
    expect(listViewMain[0].keyy!.currentState!.isOnTap, true);
    expect(listViewMain[2].keyy!.currentState!.isOnTap, true);
    expect(listViewMain[4].keyy!.currentState!.isOnTap, true);
    //kiem tra check box của các task thứ 2 4 6 vẫn giữ nguyên
    //trạng thái chưa check hay không
    expect(listViewMain[1].keyy!.currentState!.isOnTap, false);
    expect(listViewMain[3].keyy!.currentState!.isOnTap, false);
    expect(listViewMain[5].keyy!.currentState!.isOnTap, false);
    //kiem tra complete screen đã được thêm 3 task chưa
    expect(listViewComplete.length, 3);
    //kiem tra incomplete screen đã được thêm 3 task chưa
    expect(listViewIncomplete.length, 3);
    //kiem tra các 3 task thứ 1 3 5 đã check ở main screen
    //có trùng khớp giá trị với các task ở complete screen hay không
    expect(listViewMain[0].nameTask, listViewComplete[0].nameTask);
    expect(listViewMain[0].dateTimeCreate, listViewComplete[0].dateTimeCreate);
    expect(listViewMain[2].nameTask, listViewComplete[1].nameTask);
    expect(listViewMain[2].dateTimeCreate, listViewComplete[1].dateTimeCreate);
    expect(listViewMain[4].nameTask, listViewComplete[2].nameTask);
    expect(listViewMain[4].dateTimeCreate, listViewComplete[2].dateTimeCreate);
    //kiem tra các 3 task thứ 2 4 6 chưa check ở main screen
    //có trùng khớp giá trị với các task ở incomplete screen hay không
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

  //gỡ trình thử nghiệm khỏi device
  tearDownAll(() {});
}
