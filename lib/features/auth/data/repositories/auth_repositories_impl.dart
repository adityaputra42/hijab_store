import 'dart:convert';

import 'package:barakallah_hijab/core/common/entities/user.dart';
import 'package:barakallah_hijab/core/error/failures.dart';
import 'package:barakallah_hijab/features/auth/data/model/user_model.dart';
import 'package:barakallah_hijab/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/server_exception.dart';
import '../dataSource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(
    this.remoteDataSource,
  );
  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      var response = await remoteDataSource.getCurrentUserData();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var user = UserModel.fromJson(jsonDecode(response.body!));
        return right(user);
      } else {
        return left(Failure('User not logged in!'));
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    try {
      var response =
          await remoteDataSource.login(email: email, password: password);
      if (response.statusCode == 200 || response.statusCode == 201) {
        
        var user = UserModel.fromJson(jsonDecode(response.body!));
        return right(user);
      } else {
        return left(Failure('User not logged in!'));
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      var response = await remoteDataSource.signUp(
        name: username,
        email: email,
        password: password,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var user = UserModel.fromJson(jsonDecode(response.body!));
        return right(user);
      } else {
        return left(Failure('User not logged in!'));
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
