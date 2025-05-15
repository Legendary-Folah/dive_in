import 'package:dive_in_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<bool>((ref) {
  return false;
});

final appThemeProvider = Provider<ThemeData>((ref) {
  final isDarkMode = ref.watch(themeProvider);
  return isDarkMode
      ? ThemeData.dark()
      : ThemeData.light().copyWith(
        scaffoldBackgroundColor: ColorsConst.kWhite,
        appBarTheme: AppBarTheme(backgroundColor: ColorsConst.kWhite),
      );
});
