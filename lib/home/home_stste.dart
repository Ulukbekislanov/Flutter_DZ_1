import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_01/database/todo.dart';

class HomeState {
  final List<Todo> items;
  final bool isEmpty;

  const HomeState({required this.items, required this.isEmpty});

  //исходное состояние до получения данных (до вызова методов)
  factory HomeState.initial() => const HomeState(items: [], isEmpty: true);

  //используем копию объекта для изменения свойств
  HomeState copyWith({List<Todo>? items, bool? isEmpty}) {
    return HomeState(
      items: items ?? this.items,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
