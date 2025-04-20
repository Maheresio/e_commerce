import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/value_objects/validation_value_object.dart';

class PasswordValidation extends ValidationValueObject<String?> {
  factory PasswordValidation(String? input) =>
      PasswordValidation._(validatePassword(input?? ''));

  const PasswordValidation._(super.value);

  static Either<Failure, String> validatePassword(String input) {
    if (input.isEmpty) {
      return left(Failure('Password cannot be empty'));
    }

    if (input.length < 8) {
      return left(Failure('Password must be at least 8 characters long'));
    }

    if (!RegExp(r'[A-Z]').hasMatch(input)) {
      return left(
        Failure('Password must include at least one uppercase letter'),
      );
    }

    if (!RegExp(r'[a-z]').hasMatch(input)) {
      return left(
        Failure('Password must include at least one lowercase letter'),
      );
    }

    if (!RegExp(r'\d').hasMatch(input)) {
      return left(Failure('Password must include at least one number'));
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(input)) {
      return left(
        Failure('Password must include at least one special character'),
      );
    }

    return right(input);
  }
}
