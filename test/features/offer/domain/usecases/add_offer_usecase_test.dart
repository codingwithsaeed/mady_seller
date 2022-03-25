import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/offer/domain/repositories/add_offer_repository.dart';
import 'package:mady_seller/features/offer/domain/usecases/add_offer_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_offer_usecase_test.mocks.dart';

@GenerateMocks([AddOfferRepository])
void main() {
  late AddOfferUsecase sut;
  late MockAddOfferRepository repository;

  setUp(() {
    repository = MockAddOfferRepository();
    sut = AddOfferUsecase(repository);
  });

  group('testing addOffer', () {
    const tParams = Params({'action': 'add_offer'});

    test(
      "Should return failure if repository return it",
      () async {
        //arrange
        when(repository.addOffer(any)).thenAnswer(
            (_) async => const Left(GeneralFailure(Failure.notFound)));
        //act
        final result = await sut(tParams);
        //assert
        expect(result, const Left(GeneralFailure(Failure.notFound)));
      },
    );

    test(
      "Should return true if repository return it",
      () async {
        //arrange
        when(repository.addOffer(any))
            .thenAnswer((_) async => const Right(true));
        //act
        final result = await sut(tParams);
        //assert
        expect(result, const Right(true));
      },
    );
  });
}
