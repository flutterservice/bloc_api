import 'package:dio/dio.dart';
import 'package:bloc_api/model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getData() async {
    List<UserModel> userdataList = [];
    final Dio _dio = Dio();
    try {
      Response response =
          await _dio.get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        data.forEach((element) {
          UserModel userModel = UserModel.fromJson(element);
          userdataList.add(userModel);
        });
        return userdataList;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
