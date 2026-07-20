import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';
import '../providers/auth_provider.dart';

class AuthController extends AsyncNotifier<User?> {

  @override
  Future<User?> build() async {
    return null;
  }

  Future<void> login(
    String email,
    String password,
  ) async {

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {

      final user = await ref
          .read(loginUseCaseProvider)
          .call(email, password);

      return user;
    });
  }
}