import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is DarkEvent)
      yield DarkTheme();
    else
      yield LightTheme();
  }

  // fetching ThemeState from json key 'theme'
  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    if (json['theme'] == 'dark')
      return DarkTheme();
    else
      return LightTheme();
  }

  // storing ThemeState in json key 'theme'
  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return {'theme': state.toString()};
  }
}
