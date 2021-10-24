import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/global.dart';
import 'package:todoapp/View/item_list_view.dart';
import 'package:todoapp/state_managent/Bloc/home_bloc.dart';
import 'package:todoapp/state_managent/Bloc/incomplete_page_bloc.dart';
import 'package:todoapp/state_managent/Event/home_event.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/state_managent/Event/incomplete_page_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  late IncompletedPageBloc incompletedPageBloc;
  late HomeBloc homeBloc;
  int index = 0;

  @override
  void initState() {
    homeBloc = BlocProvider.of(context);
    incompletedPageBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        leading: Container(
          height: 50,
          width: 300,
          decoration: const BoxDecoration(),
          child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            width: width * 3 / 4,
                            height: width * 3 / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height / 50,
                                ),
                                Text(
                                  "Create Task",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height / 30),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextField(
                                        autofocus: true,
                                        onChanged: (String text) {
                                          controller.text = text;
                                        },
                                        decoration: const InputDecoration(
                                            hintText: "Task name",
                                            border: InputBorder.none),
                                      )),
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                        shadowColor:
                                            ButtonStyleButton.allOrNull<Color>(
                                                Colors.grey),
                                        backgroundColor:
                                            ButtonStyleButton.allOrNull<Color>(
                                                Colors.white)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      homeBloc.add(CreateItemInHomePageEvent(
                                          ItemListView(
                                              controller.text,
                                              DateFormat("dd-MM-yyyy   hh:mm")
                                                  .format(DateTime.now()),
                                              keyy: GlobalKey<
                                                  ItemListViewState>())));
                                      WidgetsBinding.instance!
                                          .addPostFrameCallback((_) {
                                        incompletedPageBloc.add(
                                            CreateItemInIncompletedPageEvent());
                                      });
                                      controller.text = "";
                                    },
                                    child: Text(
                                      "Create",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: height / 40),
                                    )),
                                SizedBox(
                                  height: height / 50,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.add)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          currentIndex: index,
          onTap: (i) {
            setState(() {
              index = i;
            });
          },
          items: listPageIcon),
      body: IndexedStack(
        index: index,
        children: listPage,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
