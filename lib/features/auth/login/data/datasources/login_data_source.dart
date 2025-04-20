import '../../../../../core/services/firebase_auth_service.dart';

abstract class LoginDataSource {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class LoginDataSourceImpl implements LoginDataSource {
  FirebaseAuthService firebaseAuthService;
  LoginDataSourceImpl(this.firebaseAuthService);

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebaseAuthService.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
