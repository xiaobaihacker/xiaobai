class AccuWratherModel {
  //州
  String? region;
  //国家
  String? country;
  //省
  String? adminArea;
  //市
  String? parentCity;
  //区
  String? city;
  //最低温度
  String? minTemp;
  //最低温度
  String? unitTemp;
  //最低温度
  String? maxTemp;
  //天气
  bool? preType;

  AccuWratherModel({
    this.region,
    this.country,
    this.adminArea,
    this.parentCity,
    this.minTemp,
    this.maxTemp,
    this.unitTemp,
    this.preType,
    this.city,
  });
}