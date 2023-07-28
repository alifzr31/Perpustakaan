import 'package:dio/dio.dart';
import 'package:perpustakaan/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  final dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));
  String? token;

  _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<Response> login(FormData formData) async {
    return await dio.post(
      EndPoint.login,
      data: formData,
    );
  }

  Future<Response> register(FormData formData) async {
    return await dio.post(
      EndPoint.register,
      data: formData,
    );
  }

  Future<Response> logout() async {
    await _getToken();
    return await dio.get(
      EndPoint.logout,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}
