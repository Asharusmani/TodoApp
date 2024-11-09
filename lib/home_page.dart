import 'package:flutter/material.dart';
import 'package:to_do_list/utilis/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ['learn flutter', false],
    ['learn Java', false],
    ['go to trip', false],
    ['9th Nov is my birthday', false],
  ];
  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
  }
  void deleteTask(int index){
   setState(() {
     todoList.removeAt(index);
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          "Todo List",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Todo(
                taskName: todoList[index][0],
                taskCompleted: todoList[index][1],
                onChanged: (value) => checkBoxChanged(index), deleteFunction: (context) => deleteTask(index),

              ),
            );
          }),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Add a new Todo items",
                      hintStyle: TextStyle(color: Colors.black38),
                      filled: true,
                      fillColor: Colors.deepPurple[100],
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ))),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
