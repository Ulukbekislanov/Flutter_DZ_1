import 'package:todo_list_01/database/app_databases.dart';
import 'package:todo_list_01/database/todo.dart';

abstract class AppRepository {
  List<Todo> getList();
  void addItem(Todo item); // Добавлено для сохранения задач
}

class AppRepositoryImplementation extends AppRepository {
  final AppDatabase db;

  AppRepositoryImplementation({required this.db});

  @override
  List<Todo> getList() => db.getList();

  @override
  void addItem(Todo item) => db.addTodo(item); // Реализация добавления
}