import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/splash/domain/repositories/splash_repository.dart';
import 'package:mady_seller/features/splash/domain/usecases/splash_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'splash_usecase_test.mocks.dart';

@GenerateMocks([SplashRepository])
void main() {
  late SplashUsecase sut;
  late MockSplashRepository repository;

  setUp(() {
    repository = MockSplashRepository();
    sut = SplashUsecase(repository);
  });

  group('testing for user login', () {
    test(
      "Should return Failure if reposrity return it",
      () async {
        //arrange
        when(repository.checkLoggin()).thenAnswer(
          (_) async => const Left(
            GeneralFailure(Failure.noInternetConnection),
          ),
        );
        //act
        final result = await sut.checkLogin();
        //assert
        expect(
          result,
          const Left(
            GeneralFailure(Failure.noInternetConnection),
          ),
        );
        verify(repository.checkLoggin());
        verifyNoMoreInteractions(repository);
      },
    );

    test(
      "Should return true if reposrity return it",
      () async {
        //arrange
        when(repository.checkLoggin())
            .thenAnswer((_) async => const Right(true));
        //act
        final result = await sut.checkLogin();
        //assert
        expect(result, const Right(true));
      },
    );
  });
}
