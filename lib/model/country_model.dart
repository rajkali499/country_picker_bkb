class Country_Model {
  int? id;
  String? name;
  String? emoji;
  String? emojiU;
  List<State_Model>? state;
  String? dialCode;
  String? code;

  Country_Model(
      {this.id,
        this.name,
        this.emoji,
        this.emojiU,
        this.state,
        this.dialCode,
        this.code});

  Country_Model.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    emoji = json['emoji']??"";
    emojiU = json['emojiU']??"";
    if (json['state'] != null) {
      state = <State_Model>[];
      json['state'].forEach((v) {
        state?.add(new State_Model.fromJson(v));
      });
    }
    dialCode = json['dial_code']??"";
    code = json['code']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['emoji'] = this.emoji;
    data['emojiU'] = this.emojiU;
    if (this.state != null) {
      data['state'] = this.state?.map((v) => v.toJson()).toList();
    }
    data['dial_code'] = this.dialCode;
    data['code'] = this.code;
    return data;
  }
}

class State_Model {
  int? id;
  String? name;
  int? countryId;
  List<City_Model>? city;

  State_Model({this.id, this.name, this.countryId, this.city});

  State_Model.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    countryId = json['country_id']??0;
    if (json['city'] != null) {
      city = <City_Model>[];
      json['city'].forEach((v) {
        city?.add(new City_Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    if (this.city != null) {
      data['city'] = this.city?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City_Model {
  int? id;
  String? name;
  int? stateId;

  City_Model({this.id, this.name, this.stateId});

  City_Model.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    stateId = json['state_id']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    return data;
  }
}