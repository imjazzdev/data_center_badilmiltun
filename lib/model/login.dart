class UserLogin {
  int id;
  String name, email, token;

  UserLogin({this.id = 0, this.name = '', this.email = '', this.token = ''});
  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        id: json['Id'],
        name: json['Name'],
        email: json['Email'],
        token: json['Token']);
  }
}
