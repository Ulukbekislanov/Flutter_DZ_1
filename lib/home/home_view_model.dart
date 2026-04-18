import 'package:todo_list_01/database/app_rapository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_01/home/home_stste.dart';

class HomeViewModel extends Cubit<HomeState> {
  final AppRepository repo;

  HomeViewModel({required this.repo}) : super(HomeState.initial());

  Future<void> getList() async {
    try {
      //ждем список
      final items = await repo.getList();
      //проверяе  пустой ли
      if (items.isEmpty) {
        //если пусто, нужно нарисовать пустой экран с кнопкой добавить
        emit(state.copyWith(isEmpty: true));
      } else {
        //если список не пустой,
        emit(state.copyWith(items: items, isEmpty: false));
      }
    } catch (e) {
      print(e);
    }
  }
}
