import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  // Initializing StateNotifier
  CounterNotifier() : super(0);
  void increment() {
    state = state++;
  }

  void decrement() {
    state = state--;
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
