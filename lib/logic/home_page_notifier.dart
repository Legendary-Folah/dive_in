import 'package:dio/dio.dart';
import 'package:dive_in_app/models/page_data.dart';
import 'package:dive_in_app/models/pokemon_model.dart';
import 'package:dive_in_app/services/API_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// Notifier for managing the state of the home page.
class HomePageNotifier extends StateNotifier<HomePageData> {
  final String _baseUrl = "https://pokeapi.co/api/v2/";
  final GetIt _getIt = GetIt.instance;
  late ApiService _apiService;

  HomePageNotifier(super._state) {
    _apiService = _getIt.get<ApiService>();
    loadData();
  }

  /// Fetches data for the home page.
  Future<void> loadData() async {
    if (state.data == null) {
      Response? response = await _apiService.get(
        '$_baseUrl/pokemon?limit=20&offset=0',
      );
      if (response != null && response.data != null) {
        PokemonListData data = PokemonListData.fromJson(response.data);
        state = state.copyWith(data: data);
        print(state.data?.results?.first);
      }
    } else {}
  }
}

final homePageProvider = StateNotifierProvider<HomePageNotifier, HomePageData>((
  ref,
) {
  return HomePageNotifier(HomePageData.initial());
});
