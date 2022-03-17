import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mady_seller/core/utils/consts.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final http.Client _client;

  const NetworkInfoImpl(this._client);

  @override
  Future<bool> get isConnected async {
    try {
      final result = await _client.post(
      currentCheckUrl,
      body: {'action': 'check_online'},
    ).timeout(const Duration(seconds: 5));
    if (result.statusCode == 200) {
      if (jsonDecode(result.body)['success'] == 1) return true;
      return false;
    }
    return false;
    } on TimeoutException {
      return false;
    }
  }
}
