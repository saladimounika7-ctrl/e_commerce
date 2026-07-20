import '../models/user_model.dart';

class AuthRemoteDatasource {
  Future<UserModel> login(
    String email,
    String password,
  ) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return UserModel(
      id: "1",
      name: "John Doe",
      email: email,
    );
  }
}