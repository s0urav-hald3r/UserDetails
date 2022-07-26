class UserModel {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;
  String? dateOfJoining;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.gender,
      this.status,
      this.dateOfJoining});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
    dateOfJoining = json['date_of_joining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['status'] = status;
    data['date_of_joining'] = dateOfJoining;
    return data;
  }
}
