import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<void> logOut() async {
    await authDataSource.logOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return authDataSource.authStateChanges();
  }

  @override
  User? get currentUser => authDataSource.currentUser;
}
