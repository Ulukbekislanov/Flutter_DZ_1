import 'package:todo_list_01/database/todo.dart';

class AppDatabase {
  List<Todo> _todoList = [
    Todo(id: 1,title: "Купить абонемент в зал",date: "01.09.2025",isDone: false,),
    Todo(id: 2,title: "Прочитать книгу Война и Мир",date: "12.12.2025",isDone: true,),
    Todo(id: 3, title: "Изучить английский", date: "01.01.2026", isDone: true),
    Todo(id: 4, title: "Изучить flutter", date: "02.03.2025", isDone: false),
  ];
  //CRUD

  //READ
  List<Todo> getList() {
    return _todoList;
  }

  //CREATE
  void addTodo(Todo todo) {
    _todoList.add(todo);
  }

  //UPDATE

  //DELETE
}
