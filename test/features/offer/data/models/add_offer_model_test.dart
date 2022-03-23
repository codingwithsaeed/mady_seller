import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/features/offer/data/models/add_offer/add_offer_model.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final json = fixture('add_offer_error.json');
  group('AddOfferModel test', () {
    const tModel = AddOfferModel(
      success: -2,
      error:
          "\u062a\u0627\u0631\u06cc\u062e \u062b\u0628\u062a \u0628\u0633\u062a\u0647 \u0646\u0645\u06cc\u062a\u0648\u0627\u0646\u062f \u0627\u0632 \u062a\u0627\u0631\u06cc\u062e \u0641\u0639\u0644\u06cc \u06a9\u0645\u062a\u0631 \u0628\u0627\u0634\u062f",
    );
    test(
      "Should return a solid AddOfferModel if there is error key",
      () async {
        //act
        final result = AddOfferModel.fromJson(jsonDecode(json));
        //assert
        expect(result, tModel);
      },
    );
  });
}
