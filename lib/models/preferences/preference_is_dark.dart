import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hole/models/preferences/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// a scaffold for managing a preference that is saved between sessions, using [SharedPreferences].
class PreferenceIsDark extends PreferenceBool {
  bool defaultValue = false;

  PreferenceIsDark()
      : super(
      id: 'isDark',
      title: 'Dark Theme',
      description: 'Use the global dark theme',
      help: Container(),
      iconData: Icons.lightbulb_outline,
      onSet: ({BuildContext context, bool didSet, dynamic value}) {
        DynamicTheme.of(context).setBrightness(
            value as bool ? Brightness.dark : Brightness.light);
      });

//  @override
//  Future<bool> set(BuildContext context, {String value}) {
//    if (value == '') {
//      value = defaultValue;
//    }
//    DynamicTheme.of(context)
//        .setBrightness(value == 'true' ? Brightness.dark : Brightness.light);
//    return Future.value(true);
//  }
}