import 'package:equatable/equatable.dart';

abstract class ToDoListEvents extends Equatable{
  ToDoListEvents();

  @override
  List<Object> get props =>[];
}

class AddToList extends ToDoListEvents{
  String task;

  AddToList({required this.task});
  @override 
  List<Object> get props =>[task];
}

class RemoveFromList extends ToDoListEvents{
    Object index;

  RemoveFromList({required this.index});
  @override 
  List<Object> get props =>[index];
}