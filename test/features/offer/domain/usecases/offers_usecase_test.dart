import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/offer/domain/repositories/offers_repository.dart';
import 'package:mady_seller/features/offer/domain/usecases/offers_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'offers_usecase_test.mocks.dart';

@GenerateMocks([OffersRepository])
void main() {
  late OffersUsecase sut;
  late MockOffersRepository repository;

  setUp(() {
    repository = MockOffersRepository();
    sut = OffersUsecase(repository);
  });

  group('testing getSellerId', () {
    test(
      "Should return failure if repository return it",
      () {
        //arrange
        when(repository.getSellerId())
            .thenReturn(const Left(GeneralFailure(Failure.notFound)));
        //act
        final result = sut.getSellerId();
        //assert
        expect(result, const Left(GeneralFailure(Failure.notFound)));
      },
    );

    test(
      "Should return a String if repository return it",
      () {
        //arrange
        when(repository.getSellerId()).thenReturn(const Right('9'));
        //act
        final result = sut.getSellerId();
        //assert
        expect(result, const Right('9'));
      },
    );
  });
}
