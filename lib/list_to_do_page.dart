import 'package:day15_todo/create_to_do_page.dart';
import 'package:flutter/material.dart';

import 'widget/to_do_list_item.dart';

class ListToDoPage extends StatefulWidget {
  const ListToDoPage({super.key});

  @override
  State<ListToDoPage> createState() => _ListToDoPageState();
}

class _ListToDoPageState extends State<ListToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateToDoPage(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              "DO",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black26,
                      )),
                  child: const Row(
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.filter_list_alt),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              color: Colors.blueGrey,
              width: double.infinity,
              height: 0.5,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    debugPrint("Item : $index");
                    return ToDoListItem(index: index);
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
