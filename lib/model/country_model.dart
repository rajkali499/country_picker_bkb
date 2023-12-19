class CountryModel {
  int? id;
  String? name;
  String? emoji;
  String? emojiU;
  List<StateModel>? state;
  String? dialCode;
  String? code;

  CountryModel(
      {this.id,
        this.name,
        this.emoji,
        this.emojiU,
        this.state,
        this.dialCode,
        this.code});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    emoji = json['emoji']??"";
    emojiU = json['emojiU']??"";
    if (json['state'] != null) {
      state = <StateModel>[];
      json['state'].forEach((v) {
        state?.add(StateModel.fromJson(v));
      });
    }
    dialCode = json['dial_code']??"";
    code = json['code']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['emoji'] = emoji;
    data['emojiU'] = emojiU;
    if (state != null) {
      data['state'] = state?.map((v) => v.toJson()).toList();
    }
    data['dial_code'] = dialCode;
    data['code'] = code;
    return data;
  }
}

class StateModel {
  int? id;
  String? name;
  int? countryId;
  List<CityModel>? city;

  StateModel({this.id, this.name, this.countryId, this.city});

  StateModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    countryId = json['country_id']??0;
    if (json['city'] != null) {
      city = <CityModel>[];
      json['city'].forEach((v) {
        city?.add(CityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    if (city != null) {
      data['city'] = city?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityModel {
  int? id;
  String? name;
  int? stateId;

  CityModel({this.id, this.name, this.stateId});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    stateId = json['state_id']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    return data;
  }
}