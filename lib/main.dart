import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/data/repositories/todo_repository_mock.dart';
import 'package:to_do_list/domain/repositories/todo_repository.dart';

import 'application/core/routes.dart';

void main() {
  runApp(RepositoryProvider<ToDoRepository>(
    create: (context) => ToDoRepositoryMock(),
    child: const MyApp(), 
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'To Do List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: routes,
    );
  }
}
