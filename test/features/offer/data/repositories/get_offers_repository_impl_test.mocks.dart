// Mocks generated by Mockito 5.1.0 from annotations
// in mady_seller/test/features/offer/data/repositories/get_offers_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mady_seller/core/network/network_info.dart' as _i2;
import 'package:mady_seller/features/offer/data/datasources/get_offers_remote_datasource.dart'
    as _i4;
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i2.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}

/// A class which mocks [GetOffersRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetOffersRemoteDatasource extends _i1.Mock
    implements _i4.GetOffersRemoteDatasource {
  MockGetOffersRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i5.Offer>> getOffers(Map<String, dynamic>? params) =>
      (super.noSuchMethod(Invocation.method(#getOffers, [params]),
              returnValue: Future<List<_i5.Offer>>.value(<_i5.Offer>[]))
          as _i3.Future<List<_i5.Offer>>);
}
