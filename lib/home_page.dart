import 'package:dive_in_app/constants/colors.dart';
import 'package:dive_in_app/logic/counter_provider.dart';
import 'package:dive_in_app/logic/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final darkMode = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst.white,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider);
            },
            icon: darkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Dive In'), Text('Count: $count')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state + 1;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
