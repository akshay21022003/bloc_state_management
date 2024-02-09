import 'package:block_state_management/bloc/todolist/todolist_bloc.dart';
import 'package:block_state_management/bloc/todolist/todolist_event.dart';
import 'package:block_state_management/bloc/todolist/todolist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList Example'),
      ),
      body: BlocBuilder<ToDoListBloc,ToDoListStates>(
        builder: (context, state) {
          return state.list.isEmpty ?
          const Center(child: Text("list is empty"),):
          ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.list[index]),
                  leading: Text('$index'),
                  trailing: IconButton(
                      onPressed: () {
                         context.read<ToDoListBloc>().add(RemoveFromList(index: state.list[index]));
                      }, icon: const Icon(Icons.delete)),
                );
              });
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            for(int i=0;i<5;i++){
                context.read<ToDoListBloc>().add(AddToList(task:"Task $i"));
            }
          }, child: const Icon(Icons.add)),
    );
  }
}
