class MockStudent {
  final String id;
  final String name;
  final String nis;
  final String room;
  final String generalClass;
  final String religiousClass;
  final String quranClass;
  final String guardianName;

  const MockStudent({
    required this.id,
    required this.name,
    required this.nis,
    required this.room,
    required this.generalClass,
    required this.religiousClass,
    required this.quranClass,
    required this.guardianName,
  });
}

class MockStudentData {
  static const student = MockStudent(
    id: 'ST-001',
    name: 'Mustofa',
    nis: '202312345',
    room: 'Asrama Umar Bin Khattab',
    generalClass: 'S1 Sarjana Hukum',
    religiousClass: '2 Aliyah',
    quranClass: 'Halaqah Al-Baqarah',
    guardianName: 'Bpk. Ahmad Mustofa',
  );
}
