part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class DarkEvent extends ThemeEvent {}
class LightEvent extends ThemeEvent {}