import 'dart:async';
import 'dart:convert';

import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    try {
      final result = await ApiProviderImpl().post(
        currentCheckUrl,
        params: {'action': 'check_online'},
      );
      if (jsonDecode(result.body)['success'] == 1) return true;
      return false;
    } on Exception {
      return false;
    }
  }
}
