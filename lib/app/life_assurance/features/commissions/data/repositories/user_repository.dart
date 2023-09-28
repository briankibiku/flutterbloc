import '../data_providers/user_api.dart';
import '../models/user_model.dart';

class UserRepository {
  final UserApi api;

  UserRepository(this.api);

  Future<List<UserModel>> fetchUsers() async {
    final List<dynamic> rawData = await api.fetchUsers();

    final List<UserModel> users = rawData.map((user) {
      return UserModel.fromJson(user);
    }).toList();

    return users;
  }
}
