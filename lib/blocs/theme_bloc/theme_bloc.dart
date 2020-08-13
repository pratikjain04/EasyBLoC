import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this.event) : super(LightTheme()); // initial state is Light Theme
  final ThemeEvent event;


//  @override
//  ThemeState get initialState {
//
//  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
   if(event is DarkEvent)
     yield DarkTheme();
   else
     yield LightTheme();
  }
//
//  // fetching ThemeState from json key 'theme'
//  @override
//  ThemeState fromJson(Map<String, dynamic> json) {
//    return json['theme'] as ThemeState;
//  }
//
//  // storing ThemeState in json key 'theme'
//  @override
//  Map<String, dynamic> toJson(ThemeState state) {
//   return {
//     'theme': state
//   };
//  }
}
