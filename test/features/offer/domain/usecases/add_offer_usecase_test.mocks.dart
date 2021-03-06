// Mocks generated by Mockito 5.1.0 from annotations
// in mady_seller/test/features/offer/domain/usecases/add_offer_usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mady_seller/core/errors/failure.dart' as _i5;
import 'package:mady_seller/core/network/params.dart' as _i6;
import 'package:mady_seller/features/offer/domain/repositories/add_offer_repository.dart'
    as _i3;
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

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [AddOfferRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddOfferRepository extends _i1.Mock
    implements _i3.AddOfferRepository {
  MockAddOfferRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> uploadPicture(
          _i6.Params? params) =>
      (super.noSuchMethod(Invocation.method(#uploadPicture, [params]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> addOffer(_i6.Params? params) =>
      (super.noSuchMethod(Invocation.method(#addOffer, [params]),
              returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>()))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
