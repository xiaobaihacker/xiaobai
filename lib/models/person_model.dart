class PersonModel {
  String? postTime;
  String? title;
  String? subTitle;
  String? langs;
  List? introduce;
  int? aticleId;

  PersonModel({
    this.postTime,
    this.title,
    this.subTitle,
    this.langs,
    this.introduce,
    this.aticleId,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
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