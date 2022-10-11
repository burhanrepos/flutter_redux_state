import 'dart:ui';

import 'package:states_redux/model/app_state.dart';
import 'actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload!;
  } else if (action is Italic) {
    newState.italic = action.payload!;
  } else if (action is TextColor) {
    newState.color = action.payload as Color;
  }
  return newState;
}
