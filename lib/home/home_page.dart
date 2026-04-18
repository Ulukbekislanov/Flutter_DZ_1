import 'package:flutter/material.dart';
import 'package:todo_list_01/add/add_page.dart';
import 'dart:math';

import 'package:todo_list_01/database/app_databases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_01/database/app_rapository.dart';
import 'package:todo_list_01/home/home_stste.dart';
import 'package:todo_list_01/home/home_view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeViewModel vm;
  int _counter = 0;
  bool isVisible = true;
  Color containerColor = Colors.blue;
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.black,
    Colors.yellow,
    Colors.green,
  ];
  AppDatabase db = AppDatabase();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("HomePage - initState");

    final db = AppDatabase();
    final repo = AppRepositoryImplementation(db: db);
    vm = HomeViewModel(repo: repo);
    vm.getList();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("HomePage - didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("HomePage - build");
    return BlocProvider.value(
      value: vm,
      child: Scaffold(
        body: BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            if (state.isEmpty) {
              return Center(child: Column(children: [
                Padding(padding: .all(100)),
                Text("У вас нет задачи"),
              TextButton(onPressed: ()=> (), child: Text("Добавить"))
              ],));
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Text(widget.title),
                ),
                body: Center(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final todo = state.items[index];
                      return ListTile(title: Text(todo.title));
                    },
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: _navigateToAddPage,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   print("HomePage - build");
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: .center,
  //         children: [
  //           Visibility(
  //             visible: isVisible,
  //             child: const Text('You have pushed the button this many times:')
  //           ),
  //           Text(
  //             '$_counter',
  //             style: Theme.of(context).textTheme.headlineMedium,
  //           ),
  //           Container(width: 200, height: 100, color: containerColor),
  //           TextButton(onPressed: _updateUI, child: Text("Test"))
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _incrementCounter,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }

  Future _navigateToAddPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddPage()),
    );
    if (result != null) {
      print("Текст со второго экрана: $result");
    }
  }

  void _updateUI() {
    setState(() {
      isVisible = !isVisible;
      containerColor = colorList[Random().nextInt(colorList.length)];
    });
    print("isVisible: $isVisible");
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("HomePage - didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("HomePage - deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("HomePage - dispose");
  }
}

extension on Random {
  void nextInt(int lenth) {}
}
