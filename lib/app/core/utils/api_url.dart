class ApiUrl {
  // static const String baseUrl = 'http://192.168.1.11:8000/api';
  static const String baseUrl = 'http://10.1.1.172:8000/api';
  static EndPoint endPoint = EndPoint();
}

class EndPoint {
  static const String login = '/login';
  static const String logout = '/logout';
  static const String register = '/register';
  static const String profile = '/user';
  static const String buku = '/buku';
}