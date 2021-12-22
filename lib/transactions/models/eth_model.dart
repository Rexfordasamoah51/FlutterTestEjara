import 'dart:convert';

Ether etherFromJson(String str) => Ether.fromJson(json.decode(str));

String etherToJson(Ether data) => json.encode(data.toJson());

class Ether {
  Ether({
    this.number,
    this.hash,
    this.parentHash,
    this.nonce,
    this.sha3Uncles,
    this.logsBloom,
    this.transactionsRoot,
    this.stateRoot,
    this.author,
    this.miner,
    this.extraData,
    this.size,
    this.gasLimit,
    this.gasUsed,
    this.timestamp,
    this.transactions = const [],
    this.mixHash,
  });

  int? number;
  String? hash;
  String? parentHash;
  double? nonce;
  String? sha3Uncles;
  String? logsBloom;
  String? transactionsRoot;
  String? stateRoot;
  String? author;
  String? miner;
  String? extraData;
  int? size;
  int? gasLimit;
  int? gasUsed;
  int? timestamp;
  List transactions;
  dynamic mixHash;

  factory Ether.fromJson(Map<String, dynamic> json) => Ether(
        number: json["number"],
        hash: json["hash"],
        parentHash: json["parentHash"],
        nonce: json["nonce"].toDouble(),
        sha3Uncles: json["sha3Uncles"],
        logsBloom: json["logsBloom"],
        transactionsRoot: json["transactionsRoot"],
        stateRoot: json["stateRoot"],
        author: json["author"],
        miner: json["miner"],

        extraData: json["extraData"],
        size: json["size"],
        gasLimit: json["gasLimit"],
        gasUsed: json["gasUsed"],
        timestamp: json["timestamp"],
        transactions: json["transactions"] ?? [],
        mixHash: json["mixHash"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "hash": hash,
        "parentHash": parentHash,
        "nonce": nonce,
  
        "sha3Uncles": sha3Uncles,
        "logsBloom": logsBloom,
        "transactionsRoot": transactionsRoot,
        "stateRoot": stateRoot,
        "author": author,
        "miner": miner,
        "extraData": extraData,
        "size": size,
        "gasLimit": gasLimit,
        "gasUsed": gasUsed,
        "timestamp": timestamp,
        "transactions": transactions,
        "mixHash": mixHash,
      };
}
