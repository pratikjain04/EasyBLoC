import 'package:authbloc/blocs/theme_bloc/theme_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Scaffold(
              body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text(user.displayName)),
                  Center(
                    child: Switch(
                        value: state is DarkTheme ? true : false,
                        onChanged: (val) {
                          if(val == null)
                            context.bloc<ThemeBloc>().add(LightEvent());
                          else
                            context.bloc<ThemeBloc>().add(val ? DarkEvent() : LightEvent());
                        }),
                  )
                ],
              ),
            )
            );
          },
    );
  }
}
