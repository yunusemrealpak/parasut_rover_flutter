class UserModel {
  String? email;
  String? imageUrl;
  String? name;
  
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    imageUrl = json["imageUrl"];
    name = json["name"];
  }
}