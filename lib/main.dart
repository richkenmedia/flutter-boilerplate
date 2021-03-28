import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/features/group/presentation/bloc/cubit/group_cubit.dart';
import 'package:boilerplate/features/group/data/repositories/group.dart';

import 'package:boilerplate/features/group/presentation/pages/group_search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => GroupCubit(FakeGroupRepository()),
        child: GroupSearchPage(),
      ),
    );
  }
}
