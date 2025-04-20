import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/value_objects/validation_value_object.dart';

class NameValidation extends ValidationValueObject<String?> {
  factory NameValidation(String? input) {
    return NameValidation._(validateName(input ?? ''));
  }

  const NameValidation._(super.value);

  static Either<Failure, String> validateName(String input) {
    const nameRegex = r"^[a-zA-Z ,.'-]+$";

    if (input.isEmpty) {
      return left(Failure('Name cannot be empty'));
    }

    if (input.length > 50) {
      return left(Failure('Name is too long'));
    }

    if (!RegExp(nameRegex).hasMatch(input)) {
      return left(Failure('Invalid name format'));
    }

    return right(input.trim());
  }
}