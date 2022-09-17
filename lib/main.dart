// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // save data
  final List<String> _todolist = <String>[];
  // adding text
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // app layout
    return Scaffold(
      appBar: AppBar(title: const Text('Things to Conquer'), backgroundColor: Colors.black,),
      body: ListView(children: _getItems()),
      // add items to the to-do list
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          backgroundColor: Colors.black,
          child: Icon(Icons.add)),
    );
  }

// adding the data to the list
  void _addItems(String title) {
    // a set state will notify the app that the state has changed
    setState(() {
      _todolist.add(title);
      _textEditingController.clear();
    });
  }

  // this Generate list of item widgets
  Widget _buildItem(String title) {
    return ListTile(title: Text(title));
  }

  // display a dialog for the user to enter items
  Future<Future> _displayDialog(BuildContext context) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              // add button
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addItems(_textEditingController.text);
                },
              ),
              // Cancel button
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  //looping through our todo list title
  List<Widget> _getItems() {
    final List<Widget> _widgetsTodo = <Widget>[];
    for (String item in _todolist) {
      _widgetsTodo.add(_buildItem(item));
    }
    return _widgetsTodo;
  }

  // removing items from the list

}