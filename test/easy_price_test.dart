import 'package:flutter_test/flutter_test.dart';

import 'package:easy_price/easy_price.dart';

void main() {
  test('adds one to input values', () {
    const currency = EasyPrice(
      price: 1750000,
      currencyType: 'inr',
      precision: 1,
    );
    expect(currency, '17.5 Lacs');
  });
}
