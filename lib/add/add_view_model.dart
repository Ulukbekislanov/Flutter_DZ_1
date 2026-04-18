import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_01/add/add_state.dart';
import 'package:todo_list_01/database/app_rapository.dart';
import 'package:todo_list_01/database/todo.dart';

class AddViewModel extends Cubit<AddState> {
  final AppRepository repo;

  AddViewModel({required this.repo}) : super(AddState.initial());

  void saveTodo(String text) {
    if (text.isEmpty) {
      // Если пусто: ошибка
      emit(state.copyWith(isInitial: false, isSucceed: false));
    } else {
      // Если не пусто: сохраняем и успех
      final newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: text,
        date: DateTime.now().toString(),
        isDone: false,
      );
      
      repo.addItem(newTodo);
      emit(state.copyWith(isInitial: false, isSucceed: true));
    }
  }
}