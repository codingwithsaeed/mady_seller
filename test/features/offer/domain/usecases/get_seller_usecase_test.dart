import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/offer/domain/repositories/get_seller_repository.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_seller_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_seller_usecase_test.mocks.dart';
@GenerateMocks([GetSellerRepository])
void main() {
  late GetSellerUsecase sut;
  late MockGetSellerRepository repository;

  setUp(() {
    repository = MockGetSellerRepository();
    sut = GetSellerUsecase(repository);
  });

  group('testing getSellerId', () {
    test(
      "Should return failure if repository return it",
      () {
        //arrange
        when(repository.getSellerId())
            .thenReturn(const Left(GeneralFailure(Failure.notFound)));
        //act
        final result = sut();
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
        final result = sut();
        //assert
        expect(result, const Right('9'));
      },
    );
  });
}
