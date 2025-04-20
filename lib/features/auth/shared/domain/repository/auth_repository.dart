import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> logOut();
  Stream<User?> authStateChanges();
  User? get currentUser;
}