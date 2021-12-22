import 'package:ejaratest/common/values/values.dart';
import 'package:ejaratest/http/request..dart';
import 'package:ejaratest/transactions/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

//Managing our api request
class HashAPI {
  static Future<LatestResponseModel> getLatest() async {
    try {
      response = await Request().get(
        '/latestblock',
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showToast(retry);
    }
    return LatestResponseModel.fromJson(response);
  }
}
