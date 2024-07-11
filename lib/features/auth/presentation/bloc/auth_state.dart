part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final usernameSignUpController = TextEditingController();
  final emailSignUpController = TextEditingController();
  final passwordSignUpController = TextEditingController();
  final emailSignInController = TextEditingController();
  final passwordSignInController = TextEditingController();
  final confirmSignUpController = TextEditingController();
  AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
