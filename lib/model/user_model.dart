class UserModel {
  String userId, email, name, pic;

  UserModel({this.email, this.name, this.userId, this.pic});
  UserModel.fromJson(Map<dynamic,dynamic>map){
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
