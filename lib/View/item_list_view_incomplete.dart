import 'package:flutter/material.dart';
import 'package:todoapp/global.dart';

class ItemListViewIncomplete extends StatelessWidget {
  final String dateTimeCreate;
  final String nameTask;
  const ItemListViewIncomplete(this.nameTask, this.dateTimeCreate, {Key? key})
      : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
            subtitle: Text(dateTimeCreate),
            title: Text(nameTask),
            trailing: const Text(
              "Incomplete",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
