import 'package:dive_in_app/learn_home.dart';
import 'package:dive_in_app/logic/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const LearnHome(),
    );
  }
}
