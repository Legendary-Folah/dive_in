import 'package:dive_in_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = StateProvider<bool>((ref) => false);

final themeProvider = Provider<ThemeData>((ref) {
  final isDarkMode = ref.watch(appThemeProvider);
  return isDarkMode
      ? ThemeData.dark()
      : ThemeData.light().copyWith(
        scaffoldBackgroundColor: ColorsConst.white,
        appBarTheme: AppBarTheme(color: ColorsConst.white),
      );
});
