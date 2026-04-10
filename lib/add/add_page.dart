import 'package:flutter/material.dart';
import 'dart:async';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late Timer _timer;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('AddPage - initState');
    // Оставляем твой таймер для отслеживания работы экрана
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print("Активное время: ${date.minute}:${date.second}");
    });
  }

  // Метод сохранения и возврата данных
  void _saveTodo() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      // Передаем текст обратно на главный экран
      Navigator.pop(context, text);
    } else {
      // Если поле пустое, можно показать подсказку
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название задачи')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Новая задача"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Что нужно сделать?',
                hintText: 'Например: Купить молоко',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saveTodo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Сохранить задачу"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('AddPage - dispose');
    _timer.cancel(); // Обязательно отменяем таймер
    _textController.dispose(); // Освобождаем ресурсы контроллера
    super.dispose();
  }
}