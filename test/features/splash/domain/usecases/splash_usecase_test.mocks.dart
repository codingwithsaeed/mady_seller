// Mocks generated by Mockito 5.1.0 from annotations
// in mady_seller/test/features/splash/domain/usecases/splash_usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mady_seller/core/errors/failure.dart' as _i5;
import 'package:mady_seller/features/splash/domain/repositories/splash_repository.dart'
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

/// A class which mocks [SplashRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSplashRepository extends _i1.Mock implements _i3.SplashRepository {
  MockSplashRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> checkLoggin() =>
      (super.noSuchMethod(Invocation.method(#checkLoggin, []),
              returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>()))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
