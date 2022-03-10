import 'dart:convert';
import 'package:flutter/material.dart';
import 'apis/api.dart';
import 'package:http_demo/models/todo.dart';

void main()=>runApp(TodoApp());
class TodoApp extends StatelessWidget {
  const TodoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListApp(),
    );
  }
}
class TodoListApp extends StatefulWidget {
  const TodoListApp({Key key}) : super(key: key);

  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<Todo> list = new List<Todo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView.builder(itemCount:list.length, itemBuilder: (context,position){
        return ListTile(title: Text(list[position].title),);
      },
      ),
    );
  }
  getTodos(){
Api.getTodos().then((response){
  setState(() {
    setState(() {
      Iterable list = json.decode(response.body);
     this.list = list.map((model) => Todo.fromjson(model)).toList();


    });
  });
});
  }
  @override
  void initState() {
    super.initState();
    getTodos();
  }
}

