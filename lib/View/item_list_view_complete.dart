import 'package:flutter/material.dart';
import 'package:todoapp/global.dart';

class ItemListViewComplete extends StatelessWidget {
  final String dateTimeCreate;
  final String nameTask;
  const ItemListViewComplete(this.nameTask, this.dateTimeCreate, {Key? key})
      : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          subtitle: Text(dateTimeCreate),
          title: Text(nameTask),
          trailing: const Text(
            "Complete",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
