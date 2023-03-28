import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/cubit/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TodoCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
         Padding(padding: EdgeInsets.all(12),
           child:  TextField(
             controller: _controller,
           ),
         ),
          SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: ()=>BlocProvider.of<TodoCubit>(context).addTodoList(_controller.text),
              child: Text("Submit"),
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoInitial>(
              builder: (context, state) {
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(state.todos[index]),
                          trailing: IconButton(
                              onPressed: ()=>BlocProvider.of<TodoCubit>(context).deleteTodoList(index),
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
