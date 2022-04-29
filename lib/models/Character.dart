class Character {
  String? sId;
  List<String>? aliases;
  List<String>? otherRelations;
  List<String>? affiliation;
  List<String>? occupation;
  List<String>? residence;
  List<String>? appearsInEpisodes;
  String? photo;
  String? name;
  String? status;
  String? gender;
  String? eyeColor;
  String? portrayedBy;

  Character(
      {this.sId,
      this.aliases,
      this.otherRelations,
      this.affiliation,
      this.occupation,
      this.residence,
      this.appearsInEpisodes,
      this.photo,
      this.name,
      this.status,
      this.gender,
      this.eyeColor,
      this.portrayedBy});

  Character.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    aliases = json['aliases'].cast<String>();
    otherRelations = json['otherRelations'].cast<String>();
    affiliation = json['affiliation'].cast<String>();
    occupation = json['occupation'].cast<String>();
    residence = json['residence'].cast<String>();
    appearsInEpisodes = json['appearsInEpisodes'].cast<String>();
    photo = json['photo'];
    name = json['name'];
    status = json['status'];
    gender = json['gender'];
    eyeColor = json['eyeColor'];
    portrayedBy = json['portrayedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['aliases'] = this.aliases;
    data['otherRelations'] = this.otherRelations;
    data['affiliation'] = this.affiliation;
    data['occupation'] = this.occupation;
    data['residence'] = this.residence;
    data['appearsInEpisodes'] = this.appearsInEpisodes;
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['status'] = this.status;
    data['gender'] = this.gender;
    data['eyeColor'] = this.eyeColor;
    data['portrayedBy'] = this.portrayedBy;
    return data;
  }
}
