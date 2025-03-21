import 'package:dive_in_app/logic/counter_provider.dart';
import 'package:dive_in_app/logic/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LearnHome extends ConsumerWidget {
  const LearnHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final darkMode = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.invalidate(counterProvider);
          },
          icon: Icon(Icons.refresh),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).state = !darkMode;
            },
            icon: darkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text('Dive In'),
            SizedBox(height: 5),
            Text('Count: ${count.toString()}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
