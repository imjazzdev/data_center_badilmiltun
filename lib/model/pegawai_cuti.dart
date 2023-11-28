class PegawaiCuti {
  final String nama, tanggal_cuti, jenis_cuti, alasan_cuti, photo;
  PegawaiCuti(
      {required this.nama,
      required this.tanggal_cuti,
      required this.jenis_cuti,
      required this.alasan_cuti,
      required this.photo});

  factory PegawaiCuti.fromJson(Map<String, dynamic> json) {
    return PegawaiCuti(
        nama: json['nama'].toString(),
        tanggal_cuti: json['tanggal_cuti'].toString(),
        jenis_cuti: json['jenis_cuti'].toString(),
        alasan_cuti: json['alasan_cuti'].toString(),
        photo: json['photo']);
  }
}
