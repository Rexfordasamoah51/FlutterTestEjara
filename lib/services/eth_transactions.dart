//Managing our api request
import 'package:ejaratest/common/values/values.dart';
import 'package:ejaratest/http/request..dart';
import 'package:ejaratest/transactions/models/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EtherCAPI {
  static Future<Ether> getLatest() async {
    try {
      response =
          await Request().get('http://api.blockchain.info/eth/latestblock');
    } catch (e) {
      EasyLoading.showToast(retry);
    }
    return Ether.fromJson(response);
  }
}
