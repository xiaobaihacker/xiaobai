class SciOnlineModel {
  String? postTime;
  String? title;
  String? subTitle;
  String? langs;
  List? introduce;
  int? aticleId;

  SciOnlineModel({
    this.postTime,
    this.title,
    this.subTitle,
    this.langs,
    this.introduce,
    this.aticleId,
  });

  factory SciOnlineModel.fromJson(Map<String, dynamic> json) => SciOnlineModel(
    postTime:json["postTime"],
    title: json["title"],
    subTitle: json["subTitle"],
    langs: json["langs"],
    introduce: json["introduce"],
    aticleId:json['aticleId']
  );

  Map<String, dynamic> toJson() => {
    "postTime":postTime,
    "title": title,
    "subTitle": subTitle,
    "langs": langs,
    "introduce":introduce,
    "aticleId":aticleId
  };

}