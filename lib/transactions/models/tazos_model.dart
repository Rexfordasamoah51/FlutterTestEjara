import 'dart:convert';

List<Tazos> tazosFromJson(String str) =>
    List<Tazos>.from(json.decode(str).map((x) => Tazos.fromJson(x)));

String tazosToJson(List<Tazos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tazos {
  Tazos({
    this.cycle,
    this.level,
    this.hash,
  
    this.proto,
    this.priority,
    this.validations,
    this.deposit,
    this.reward,
    this.fees,
    this.nonceRevealed,
    this.lbEscapeVote,
    this.lbEscapeEma,
  });

  int? cycle;
  int? level;
  String? hash;
  int? proto;
  int? priority;
  int? validations;
  int? deposit;
  int? reward;
  int? fees;
  bool? nonceRevealed;
  bool? lbEscapeVote;
  int? lbEscapeEma;

  factory Tazos.fromJson(Map<String, dynamic> json) => Tazos(
        cycle: json["cycle"],
        level: json["level"],
        hash: json["hash"],
        proto: json["proto"],
        priority: json["priority"],
        validations: json["validations"],
        deposit: json["deposit"],
        reward: json["reward"],
        fees: json["fees"],
        nonceRevealed: json["nonceRevealed"],
        lbEscapeVote: json["lbEscapeVote"],
        lbEscapeEma: json["lbEscapeEma"],
      );

  Map<String, dynamic> toJson() => {
        "cycle": cycle,
        "level": level,
        "hash": hash,
        "proto": proto,
        "priority": priority,
        "validations": validations,
        "deposit": deposit,
        "reward": reward,
        "fees": fees,
        "nonceRevealed": nonceRevealed,
        "lbEscapeVote": lbEscapeVote,
        "lbEscapeEma": lbEscapeEma,
      };
}
