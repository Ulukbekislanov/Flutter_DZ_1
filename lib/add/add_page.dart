import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_01/add/add_state.dart';
import 'package:todo_list_01/add/add_view_model.dart';
import 'package:todo_list_01/database/app_databases.dart';
import 'package:todo_list_01/database/app_rapository.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late final AddViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    final db = AppDatabase();
    final repo = AppRepositoryImplementation(db: db);
    _viewModel = AddViewModel(repo: repo);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Добавить задачу"),
          centerTitle: true,
        ),
        body: BlocBuilder<AddViewModel, AddState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Введите название задачи'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Логика отображения сообщений в зависимости от состояния
                  if (!state.isInitial && !state.isSucceed)
                    const Text(
                      "Введите название",
                      style: TextStyle(color: Colors.red),
                    ),
                  if (!state.isInitial && state.isSucceed)
                    const Text(
                      "Сохранено!",
                      style: TextStyle(color: Colors.green),
                    ),
                    
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _viewModel.saveTodo(_textEditingController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color.fromARGB(255, 77, 172, 250),
                      ),
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _viewModel.close();
    super.dispose();
  }
}