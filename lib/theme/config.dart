library config.global;

import 'package:ghost/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

MyTheme currentTheme = MyTheme();
SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
