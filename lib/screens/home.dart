import 'package:flutter/material.dart';

import '../model/things_to_conquer.dart';
import '../constants/colors.dart';
import '../widgets/single_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final thingsList = ThingsToConquer.listToConquer();
  List<ThingsToConquer> _foundToDo = [];
  final _thingToDo = TextEditingController();

  @override
  void initState() {
    _foundToDo = thingsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'Things to Conquer:',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ThingsToConquer thing in _foundToDo.reversed)
                        SingleItem(
                          todo: thing,
                          onToDoChanged: _checkBox,
                          onDeleteItem: _removeItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _thingToDo,
                    decoration: const InputDecoration(
                        hintText: 'Add to Conquer',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _addItem(_thingToDo.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlack,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _checkBox(ThingsToConquer item) {
    setState(() {
      item.isDone = !item.isDone;
    });
  }

  void _removeItem(String id) {
    setState(() {
      thingsList.removeWhere((item) => item.id == id);
    });
  }

  void _addItem(String item) {
    setState(() {
      thingsList.add(ThingsToConquer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: item,
      ));
    });
    _thingToDo.clear();
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),    
      ]),
    );
  }
}