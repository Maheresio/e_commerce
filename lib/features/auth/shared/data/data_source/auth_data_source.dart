import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<void> logOut();
  Stream<User?> authStateChanges();
  User? get currentUser;
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSourceImpl(this.firebaseAuth);

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }

  @override
  User? get currentUser => firebaseAuth.currentUser;
}
