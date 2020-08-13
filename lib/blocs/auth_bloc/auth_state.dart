import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {

  AuthSuccess(this.user);
  final FirebaseUser user;
}

class AuthFailure extends AuthState {}

class IdleState extends AuthState {}