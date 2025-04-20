import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/value_objects/validation_value_object.dart';

class EmailValidation extends ValidationValueObject<String?> {
  factory EmailValidation(String? input) {
    return EmailValidation._(validateEmail(input?? ''));
  }

  const EmailValidation._(super.value);

  static Either<Failure, String> validateEmail(String input) {
   
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

    if (input.isEmpty) {
      return left(Failure('Email cannot be empty'));
    }

    if (input.length > 254) {
      return left(Failure('Email is too long'));
    }

    if (!RegExp(emailRegex).hasMatch(input)) {
      return left(Failure('Invalid email format'));
    }

    return right(input.trim().toLowerCase());
  }
}

