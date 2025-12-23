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
    name: 'Ahmad Mustofa',
    nis: '202312345',
    room: 'Asrama Umar Bin Khattab',
    generalClass: 'SMP Kelas 2',
    religiousClass: 'Diniyah Wustho',
    quranClass: 'Halaqah Al-Baqarah',
    guardianName: 'Bapak Mustofa',
  );
}
