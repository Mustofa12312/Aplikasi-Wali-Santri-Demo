class MockAnnouncement {
  final String id;
  final String title;
  final String content;
  final DateTime date;

  const MockAnnouncement({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });
}

class MockAnnouncementData {
  static final List<MockAnnouncement> announcements = [
    MockAnnouncement(
      id: 'ANN-001',
      title: 'Libur bulan Puasa',
      content: 'Kegiatan belajar mengajar diliburkan Pada bulan puasa.',
      date: DateTime(2025, 12, 14),
    ),
    MockAnnouncement(
      id: 'ANN-002',
      title: 'Pembayaran SPP',
      content:
          'Diharapkan wali santri melakukan pembayaran SPP sebelum tanggal 10 setiap bulan.',
      date: DateTime(2025, 12, 5),
    ),
    MockAnnouncement(
      id: 'ANN-003',
      title: 'Jadwal Kegiatan Jumat',
      content:
          "Kegiatan Maulid Dhiba'e akan dilaksanakan setiap Jumat malam setelah Isya. Dengan tujuan memulaikan Baginda Nabi Muhammad SAW.",
      date: DateTime(2025, 12, 2),
    ),
  ];
}
