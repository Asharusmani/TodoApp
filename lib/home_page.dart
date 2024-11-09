import 'package:flutter/material.dart';
import 'package:to_do_list/utilis/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List todoList = [
    ['learn flutter', false],
    ['learn Java', false],
    ['go to trip', false],
    ['9th Nov is my birthday', false],
  ];
  void checkBoxChanged(int index){

    setState(() {
      todoList[index][1]= !todoList[index][1];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
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
            return Todo(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
            );
          }),
    );
  }
}
