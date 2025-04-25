import 'package:dio/dio.dart';
import 'package:dive_in_app/models/page_data.dart';
import 'package:dive_in_app/services/API_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class HomePageNotifier extends StateNotifier<HomePageData> {
  final String _baseUrl = "https://pokeapi.co/api/v2/";
  final GetIt _getIt = GetIt.instance;
  late ApiService _apiService;

  HomePageNotifier(super._state) {
    _apiService = _getIt.get<ApiService>();
    _setUp();
  }

  Future<void> _setUp() async {
    loadData();
  }

  Future<void> loadData() async {
    if (state.data == null) {
      Response? response = await _apiService.get(
        '$_baseUrl/pokemon?limit=20&offset=0',
      );
      print(response.toString());
    } else {}
  }
}

final homePageProvider = StateNotifierProvider<HomePageNotifier, HomePageData>((
  ref,
) {
  return HomePageNotifier(HomePageData.initial());
});
