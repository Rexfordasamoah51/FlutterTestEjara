import 'dart:convert';

LatestResponseModel modelFromJson(String str) =>
    LatestResponseModel.fromJson(json.decode(str));

String modelToJson(LatestResponseModel data) => json.encode(data.toJson());

class LatestResponseModel {
  LatestResponseModel({
    this.height,
    this.hash,
    this.time,
    this.blockIndex,
  });

  int? height;
  String? hash;
  int? time;
  int? blockIndex;

  factory LatestResponseModel.fromJson(Map<String, dynamic> json) =>
      LatestResponseModel(
        height: json["height"],
        hash: json["hash"],
        time: json["time"],
        blockIndex: json["block_index"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "hash": hash,
        "time": time,
        "block_index": blockIndex,
      };
}
