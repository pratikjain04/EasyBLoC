import 'package:authbloc/service/auth_service.dart';
import 'package:authbloc/blocs/auth_bloc/auth_state.dart';
import 'package:authbloc/blocs/auth_bloc/auth_event.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  // injecting authService to the Bloc and also configuring the initial State
  AuthBloc(this._authService) : super(IdleState());

  final AuthService _authService; // this is the service handling the API calls

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is LoginEvent)
      yield* _mapAuthToState();
  }

  Stream<AuthState> _mapAuthToState() async* {
    yield AuthLoading();
    try {
      final firebaseUser = await _authService.signInWithGoogle();
      yield AuthSuccess(firebaseUser);
    } catch (_) {
      yield AuthFailure();
    }
  }


}
