import 'package:block_state_management/bloc/counter/counter_bloc.dart';
import 'package:block_state_management/bloc/favourite/favourite_bloc.dart';
import 'package:block_state_management/bloc/switch/switch_bloc.dart';
import 'package:block_state_management/bloc/todolist/todolist_bloc.dart';
import 'package:block_state_management/repository/favourite_repository.dart';
import 'package:block_state_management/ui/favourite/favourite_screen.dart';
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
        BlocProvider(create: (_) => ToDoListBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository()))

      ], 
      child: MaterialApp(
            title: 'Flutter Demo',
            themeMode: ThemeMode.dark,
            theme: ThemeData(
              brightness: Brightness.dark,
              useMaterial3: true,
            ),
            home: const FavouriteScreen()
            )
      );
  }
}
