import 'package:flutter/material.dart';
import 'package:todo_list_01/add/add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Список для хранения задач
  final List<String> _tasks = [];

  // Метод перехода на экран добавления
  void _navigateToAddPage() async {
    // Ждем результат (текст задачи) с экрана AddPage
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddPage()),
    );

    // Если результат получен и он не пустой — добавляем в начало списка
    if (result != null && result.toString().isNotEmpty) {
      setState(() {
        _tasks.insert(0, result.toString()); // Добавляем в начало
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _tasks.isEmpty
          ? const Center(child: Text('Список задач пуст. Добавьте первую!'))
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: const Icon(Icons.circle_outlined),
                    title: Text(_tasks[index]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddPage,
        tooltip: 'Добавить задачу',
        child: const Icon(Icons.add),
      ),
    );
  }
}