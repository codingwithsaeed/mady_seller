import 'package:http/http.dart' as http;

abstract class ApiProvider {
  Future<http.Response> post(Uri url, {required Map<String, dynamic>? params});
}

class ApiProviderImpl implements ApiProvider {
  ApiProviderImpl._internal();

  static final ApiProviderImpl _singleton = ApiProviderImpl._internal();

  factory ApiProviderImpl() => _singleton;

  @override
  Future<http.Response> post(Uri url,
          {required Map<String, dynamic>? params}) async =>
      http.Client().post(url, body: params).timeout(const Duration(seconds: 5));
}
