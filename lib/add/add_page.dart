import 'package:flutter/material.dart';
import 'dart:async';

class AddPage extends StatefulWidget{
  const AddPage ({super.key});
  
  @override
  State<StatefulWidget> createState() => _AddPage();
}
class _AddPage extends State<AddPage>{
  late Timer _timer;
  TextEditingController _textEditingController=TextEditingController();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('AddPage - initState');
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print("${date.minute}: ${date.second}");
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('AddPage - didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Добавить задачу"),
        centerTitle: true,
      ),
      body:Padding(
  padding: const EdgeInsets.all(16),
  child: 
         Column(
        
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Введите название задчи')
                )
                ),
             const Spacer(),

               
                 SizedBox(
        width: double.infinity,
        child:
            ElevatedButton(
              onPressed: _saveTodo,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: const Color.fromARGB(255, 77, 172, 250),
              ),
              child: Text(
                'Сохранить',
                style: TextStyle(color: Colors.white),
              ),
            ),
      ),

           
          ],
        ),
      )
    );
  }

  void _saveTodo (){
    Navigator.pop(context, _textEditingController.text);
  }

    @override
  void didUpdateWidget(covariant AddPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('AddPage - didUpdateWidget');
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('AddPage - deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('AddPage - dispose');
    _timer.cancel();
    _textEditingController.dispose();
    
  }

}