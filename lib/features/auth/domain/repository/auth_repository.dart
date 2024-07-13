import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entities/user.dart';
import '../../../../core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUp({
    required String username,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> currentUser();
}
