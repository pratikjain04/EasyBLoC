part of 'theme_bloc.dart';

abstract class ThemeState {}

class DarkTheme extends ThemeState {
  @override
  String toString() => 'dark';
}

class LightTheme extends ThemeState {
  @override
  String toString() => 'light';
} // initial Theme
