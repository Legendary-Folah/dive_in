import 'package:dive_in_app/models/page_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageNotifier extends StateNotifier<HomePageData> {
  HomePageNotifier(super._state);
}

final homePageProvider = StateNotifierProvider((ref) {
  return HomePageNotifier(HomePageData.initial());
});
