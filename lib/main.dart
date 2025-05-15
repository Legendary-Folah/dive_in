import 'package:dive_in_app/presentation/screens/Dummy/dummy_home.dart';
import 'package:dive_in_app/presentation/screens/home_page.dart';
import 'package:dive_in_app/logic/theme_provider.dart';
import 'package:dive_in_app/services/API_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await _setUpServices();
  runApp(ProviderScope(child: const MyApp()));
}

Future<void> _setUpServices() async {
  GetIt.instance.registerSingleton<ApiService>(ApiService());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const DummyHome(),
    );
  }
}
