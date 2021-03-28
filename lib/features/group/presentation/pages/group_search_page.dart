import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/features/group/data/models/group.dart';
import 'package:boilerplate/features/group/presentation/bloc/cubit/group_cubit.dart';
import 'package:boilerplate/features/group/data/repositories/group.dart';

class GroupSearchPage extends StatefulWidget {
  @override
  _GroupSearchPageState createState() => _GroupSearchPageState();
}

class _GroupSearchPageState extends State<GroupSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Search"),
      ),
      body: BlocProvider(
        create: (context) => GroupCubit(FakeGroupRepository()),
        child: BlocConsumer<GroupCubit, GroupState>(
          listener: (context, state) {
            if (state is GroupError) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is GroupInitial) {
              return buildInitialInput();
            } else if (state is GroupLoading) {
              return buildLoading();
            } else if (state is GroupLoaded) {
              return buildColumnWithData(state.group);
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: NameInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Group group) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          group.name,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${group.id.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        NameInputField(),
      ],
    );
  }
}

class NameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitName(BuildContext context, String groupName) {
    print("I am here");
    final groupCubit = context.read<GroupCubit>();
    groupCubit.getGroup(groupName);
  }
}
