import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class ValidationValueObject<T> extends Equatable {
  final Either<Failure, T> value;

  const ValidationValueObject(this.value);

  // Safely extract the value, throwing an exception if invalid
  // T get() =>
  //     value.fold((failure) => throw Failure(failure.message), (value) => value);

  // Check if the value is valid
  bool isValid() => value.isRight();

  @override
  List<Object?> get props => [value];
}
