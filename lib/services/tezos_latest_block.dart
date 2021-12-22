import 'package:ejaratest/common/values/values.dart';
import 'package:ejaratest/http/request..dart';
import 'package:ejaratest/transactions/models/models.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

//Managing our api request
class TezosAPI {
  static Future<Tazos> getLatest() async {
    var data = [];
    try {
      data = await Request().get('https://api.tzkt.io/v1/blocks');
    } catch (e) {
      EasyLoading.showToast(retry);
    }
    return Tazos.fromJson(data.last);
  }
}
