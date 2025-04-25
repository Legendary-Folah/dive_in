import 'package:dive_in_app/models/page_data.dart';
import 'package:dive_in_app/services/API_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class HomePageNotifier extends StateNotifier<HomePageData> {
  final GetIt _getIt = GetIt.instance;
  late ApiService _apiService;

  HomePageNotifier(super._state) {
    _apiService = _getIt.get<ApiService>();
    _setUp();
  }

  Future<void> _setUp() async {}
}
