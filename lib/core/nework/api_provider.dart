// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:mady_seller/core/errors/exceptions.dart';

abstract class ApiProvider {
  ///Performs a POST request to given url with params
  ///Returns a [ServerException] on all errors
  Future<http.Response> post(Uri url, {Map<String, dynamic>? params});
}

class ApiProviderImpl implements ApiProvider {
  ApiProviderImpl._internal();

  static final ApiProviderImpl _singleton = ApiProviderImpl._internal();

  factory ApiProviderImpl() => _singleton;

  @override
  Future<http.Response> post(Uri url, {Map<String, dynamic>? params}) async {
    try {
      final result = await http.Client()
          .post(url, body: params!)
          .timeout(const Duration(seconds: 5));

      if (result.statusCode == 200) return result;

      throw ServerException('خطا در ارتباط با سرور: ${result.statusCode}');
    } on TimeoutException {
      throw const ServerException('خطا در ارتباط با سرور');
    }
  }
}
