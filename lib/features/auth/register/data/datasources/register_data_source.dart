import '../../../../../core/services/firebase_auth_service.dart';

abstract class RegisterDataSource {
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  });
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final FirebaseAuthService firebaseAuthService;
  RegisterDataSourceImpl(this.firebaseAuthService);

  @override
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    return await firebaseAuthService.registerWithEmailAndPassword(
      email: email,
      name: name,
      password: password,
    );
  }
}
