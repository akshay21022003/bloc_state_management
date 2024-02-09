import 'package:block_state_management/bloc/counter/counter_bloc.dart';
import 'package:block_state_management/bloc/switch/switch_bloc.dart';
import 'package:block_state_management/bloc/todolist/todolist_bloc.dart';
import 'package:block_state_management/ui/switch/switch_screen.dart';
import 'package:block_state_management/ui/todolist/todolist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_)=>ToDoListBloc())
      ], 
      child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const ToDoListScreen()
            )
      );
  }
}
