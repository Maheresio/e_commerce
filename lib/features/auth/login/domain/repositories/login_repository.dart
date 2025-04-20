import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
