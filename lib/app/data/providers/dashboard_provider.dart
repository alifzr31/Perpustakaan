import 'package:dio/dio.dart';
import 'package:perpustakaan/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProvider {
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

  Future<Response> fetchProfile() async {
    await _getToken();
    return await dio.get(
      EndPoint.profile,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}
