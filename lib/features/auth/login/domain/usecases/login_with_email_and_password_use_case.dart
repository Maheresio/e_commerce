import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../shared/domain/entity/email_validation.dart';
import '../../../shared/domain/entity/password_validation.dart';
import '../repositories/login_repository.dart';

class LoginWithEmailAndPasswordUseCase {
  LoginRepository loginRepository;
  LoginWithEmailAndPasswordUseCase(this.loginRepository);
  Future<Either<Failure, void>> execute({
    required String email,
    required String password,
  }) async {
    final emailOrFailure = EmailValidation(email);
    final passwordOrFailure = PasswordValidation(password);

    return emailOrFailure.value.fold(
      (emailFailure) => left(emailFailure),
      (_) => passwordOrFailure.value.fold(
        (passwordFailure) => left(passwordFailure),
        (_) async => await loginRepository.loginWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ),
    );
  }
}
