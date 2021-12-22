import 'package:ejaratest/services/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Transactions smoke test', () {
    test(
      'should return latest bitcoin transactions  detail when all the call end perfect',
      () async {
        final hash = await HashAPI.getLatest();
        final expected = await BTCAPI.getLatest(hashcode: hash.hash!);
        expect(expected.tx.length, greaterThan(0));
      },
    );

    test(
      'should return latest etherum transactions  detail when all the call end perfect',
      () async {
        final expected = await EtherCAPI.getLatest();
        expect(expected.transactions.length, greaterThan(0));
      },
    );
    test(
      'should return latest tazos transactions  detail when all the call end perfect',
      () async {
        final expected = await TezosAPI.getLatest();
        expect(expected.hash, isNotNull);
      },
    );
  });
}
