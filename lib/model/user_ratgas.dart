class UserRatgas {
  final String nama, tanggal_pelaksanaan_ratgas, jenis_ratgas, isi_ratgas;

  UserRatgas({
    required this.nama,
    required this.tanggal_pelaksanaan_ratgas,
    required this.jenis_ratgas,
    required this.isi_ratgas,
  });

  factory UserRatgas.fromJson(Map<String, dynamic> json) {
    return UserRatgas(
        nama: json['nama'],
        tanggal_pelaksanaan_ratgas: json['tanggal_pelaksanaan_ratgas'],
        jenis_ratgas: json['jenis_ratgas'],
        isi_ratgas: json['isi_ratgas']);
  }
}
