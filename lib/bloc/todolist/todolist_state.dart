import 'package:equatable/equatable.dart';

class ToDoListStates extends Equatable{
 final  List<String> list;

  const ToDoListStates({
    this.list=const []
  });

  ToDoListStates copyWith({List<String>? list}){
    return ToDoListStates(
      list: list ?? this.list
    );
  }
  @override
  List<Object> get props =>[list];

}