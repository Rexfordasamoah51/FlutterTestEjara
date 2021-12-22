//Managing our api request
import 'package:ejaratest/common/values/values.dart';
import 'package:ejaratest/http/request..dart';
import 'package:ejaratest/transactions/models/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BTCAPI {
  static Future<BTC> getLatest({
    required String hashcode,
  }) async {
    try {
      response = await Request().get(
        'https://blockchain.info/rawblock/$hashcode',
      );
    } catch (e) {
      EasyLoading.showToast(retry);
    }
    return BTC.fromJson(response);
  }
}
