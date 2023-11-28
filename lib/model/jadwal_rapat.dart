class JadwalRapat {
  final String title, tempat, tanggal, pukul;

  JadwalRapat({
    required this.title,
    required this.tempat,
    required this.tanggal,
    required this.pukul,
  });

  factory JadwalRapat.fromJson(Map<String, dynamic> json) {
    return JadwalRapat(
      title: json['title'],
      tempat: json['tempat'],
      tanggal: json['tanggal'],
      pukul: json['pukul'],
    );
  }
}
