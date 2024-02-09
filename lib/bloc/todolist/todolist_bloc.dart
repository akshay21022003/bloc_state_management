import 'package:block_state_management/bloc/todolist/todolist_event.dart';
import 'package:block_state_management/bloc/todolist/todolist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListBloc extends Bloc<ToDoListEvents,ToDoListStates>{
  final List<String> todolist = [];
  ToDoListBloc():super(ToDoListStates()){
    on<AddToList>(_AddToList);
    on<RemoveFromList>(_RemoveFromList);
  }

  void _AddToList(AddToList events,Emitter<ToDoListStates> emit){
    todolist.add(events.task);
    emit(state.copyWith(list: List.from(todolist)));
  }

  void _RemoveFromList(RemoveFromList events,Emitter<ToDoListStates> emit){
    todolist.remove(events.index);
    emit(state.copyWith(list: List.from(todolist)));
  }
}