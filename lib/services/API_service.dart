import 'package:dio/dio.dart';

class ApiService {
  ApiService();

  final _dio = Dio();
  Future<Response?> get(String url) async {
    try {
      Response response = await _dio.get(url);
      print(response.toString());
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
