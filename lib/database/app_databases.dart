import 'package:todo_list_01/database/todo.dart';


class AppDatabase {

  List<Todo> todoList =[
    Todo(
      id: 1,
      title: 'Купить абонемент в зал', 
      date: "01.09.2026", 
      isDone: false),
      Todo(
      id: 2,
      title: 'Прочитать книгу Война м Мир', 
      date: "12.12.2026", 
      isDone: true),
      Todo(
      id: 3,
      title: 'Изучить английский', 
      date: "01.01.2026", 
      isDone: true),
      Todo(
      id: 4,
      title: 'Изучить Flutter', 
      date: "02.03.2026", 
      isDone: false),
      ];
}