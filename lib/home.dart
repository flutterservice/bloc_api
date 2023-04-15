import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_api/bloc/user_bloc.dart';
import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';

import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<UserBloc>().add(GetAllUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Bloc Pattern"),
      ),
      body: BlocBuilder<UserBloc, UserStat>(builder: (context, state) {
        if (state is UserLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is UserError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is UserDataLoaded) {
          return _view(context, state.userModelList);
        }

        return Container();
      }),
    );
  }

  Widget _view(BuildContext context, List<UserModel> userModelList) {
    return ListView.builder(
      itemBuilder: (context, itemIndex) {
        UserModel userModel = userModelList[itemIndex];
        return ListTile(
          title: Text(userModel.name),
          subtitle: Text(userModel.email.toString()),
          leading: Text(userModel.id.toString()),
        );
      },
      itemCount: userModelList.length,
    );
  }
}
