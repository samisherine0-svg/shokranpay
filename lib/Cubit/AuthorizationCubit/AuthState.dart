
part of 'AuthCubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class InitialAuthState extends AuthState {
}
class AddressLoadState extends AuthState {}

class AddressSuccessState extends AuthState {
  final c3.Data data;

  const AddressSuccessState(this.data);
}

class AddressErrorState extends AuthState {
  final String mssg;

  const AddressErrorState(this.mssg);
}
