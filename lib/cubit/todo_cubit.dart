import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class Todo{

  static List<String> data=[
'Dart','Flutter','Provider','Block','Cubit','Api','Firebase',
  ];
}

class TodoCubit extends Cubit<TodoInitial> {
  TodoCubit() : super(TodoInitial(todos: Todo.data));


  addTodoList(String addToDo) {

    final todoList=state.todos;
    todoList.add(addToDo);
    emit(TodoInitial(todos: todoList));
}

deleteTodoList(int index) {

    final todoList=state.todos;
    todoList.removeAt(index);
    emit(TodoInitial(todos: todoList));
}

}
