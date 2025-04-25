import 'package:dio/dio.dart';

class ApiService {
  ApiService();

  final _dio = Dio();
  Future<Response?> get(String path) async {
    try {
      Response response = await _dio.get(path);
      print(response.toString());
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
