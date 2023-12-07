class Login {
  final int id;
  final String nama, email, token;
  
Login({required this.id, required this.nama, required this.email, required this.token});
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json['id'],
        nama: json['nama'].toString(),
        email: json['email'],
        token: json['token']
        
        );
  }

  
}
