class UserLogin {
  String id_user, nama, nip, token, nama_jabatan;

  UserLogin(
      {this.id_user = '',
      this.nama = '',
      this.nip = '',
      this.token = '',
      this.nama_jabatan = ''});
  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        id_user: json['id_user'],
        nama: json['nama'],
        nip: json['nip'],
        token: json['token'],
        nama_jabatan: json['nama_jabatan']);
  }
}
