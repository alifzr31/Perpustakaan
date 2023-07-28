import 'package:dio/dio.dart';
import 'package:perpustakaan/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BukuProvider {
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
  
  Future<Response> fetchBuku() async {
    await _getToken();
    return await dio.get(
      EndPoint.buku,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> fetchDetailBuku(id) async {
    await _getToken();
    return await dio.get(
      '${EndPoint.buku}/$id',
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> createBuku(FormData formData) async {
    await _getToken();
    return await dio.post(
      EndPoint.buku,
      data: formData,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> updateBuku(FormData formData, id) async {
    await _getToken();
    return await dio.post(
      '${EndPoint.buku}/$id',
      data: formData,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> deleteBuku(id) async {
    await _getToken();
    return await dio.delete(
      '${EndPoint.buku}/$id',
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}