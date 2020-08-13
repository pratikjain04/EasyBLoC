import 'package:authbloc/blocs/auth_bloc/auth_bloc.dart';
import 'package:authbloc/blocs/theme_bloc/theme_bloc.dart';
import 'package:authbloc/service/auth_service.dart';
import 'package:authbloc/ui/login_page.dart';
import 'package:authbloc/blocs/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(AuthService()),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(LightTheme(), LightEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {

          if(state is DarkTheme)
            themeMode = ThemeMode.dark;
          else if(state is LightTheme)
            themeMode = ThemeMode.light;
          else
            themeMode = ThemeMode.system;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            theme: ThemeData(
                brightness: Brightness.light
            ),
            home: LoginPage(),
          );
        },
      ),
    );
  }
}

