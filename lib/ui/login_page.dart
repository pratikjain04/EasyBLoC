import 'package:authbloc/blocs/auth_bloc/auth_bloc.dart';
import 'package:authbloc/blocs/auth_bloc/auth_state.dart';
import 'package:authbloc/blocs/auth_bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text("Login Failed"),
                backgroundColor: Colors.red,
              ));
          } else if(state is AuthSuccess){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage(user: state.user)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: RaisedButton(
                child: Text("Login with Google"),
                onPressed: () => context.bloc<AuthBloc>().add(LoginEvent()),
              ),
            );
          }
        },
      ),
    );
  }
}
