import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';
import 'package:bloc_api/service/api_service.dart';

import '../model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserStat> {

  List<UserModel> userModellist =[];

  UserBloc() :super(UserInit()) {
    ApiService _apiservice = ApiService();

    on<GetAllUserList>((event, emit) async {
      try {
        emit(UserLoading());
        userModellist = await _apiservice.getData();
        emit(UserDataLoaded(userModellist));
      }catch (e){
        emit(UserError(e.toString()));
      }
    });
  }

}
