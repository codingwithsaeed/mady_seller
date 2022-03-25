import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/features/offer/data/models/get_offers/get_offers_model.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('getOffersModel FromJSON', () {
    final tJson = fixture('get_offers.json');
    var tOffers = <Offer>[
      Offer(
          oid: "5",
          content:
              "\u0628\u0633\u062a\u0647 \u062f\u0647 \u062a\u0627\u06cc\u06cc \u06af\u0648\u0634\u062a \u0628\u0648\u0642\u0644\u0645\u0648\u0646",
          date: "1400-12-23",
          sTime: "14:00",
          eTime: "23:59",
          price: "30000",
          percent: "50",
          currentPrice: "15000",
          picture: "http://192.168.1.2/mady/uploads/offerpics/meat.jpeg",
          count: "20",
          status: "2",
          isSpecial: "0"),
      Offer(
          oid: "3",
          content: "\u067e\u06cc\u062a\u0632\u0627 \u0633\u0632\u0627\u0631",
          date: "1400-12-20",
          sTime: "19:00",
          eTime: "23:59",
          price: "70000",
          percent: "50",
          currentPrice: "35000",
          picture: "http://192.168.1.2/mady/uploads/offerpics/pizza.jpeg",
          count: "10",
          status: "2",
          isSpecial: "0"),
      Offer(
          oid: "2",
          content:
              "\u067e\u06cc\u062a\u0632\u0627 \u067e\u067e\u0631\u0648\u0646\u06cc",
          date: "1400-12-20",
          sTime: "19:00",
          eTime: "23:59",
          price: "70000",
          percent: "50",
          currentPrice: "35000",
          picture: "http://192.168.1.2/mady/uploads/offerpics/pizza.jpeg",
          count: "10",
          status: "2",
          isSpecial: "0")
    ];
    var tOffersModel = GetOffersModel(offers: tOffers);
    test(
      "Should return a solid [List<Offer>] value",
      () async {
        final result = GetOffersModel.fromJson(jsonDecode(tJson));
        //assert
        expect(result, tOffersModel);
      },
    );
  });
}
