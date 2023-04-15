import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

abstract class UserStat extends Equatable {

}

class UserInit extends UserStat {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoading extends UserStat{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataLoaded extends UserStat {

  List<UserModel> userModelList;

  UserDataLoaded(this.userModelList);

  @override
  // TODO: implement props
  List<Object?> get props => [userModelList];
}

class UserError extends UserStat {
  String message;
  UserError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}