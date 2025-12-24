enum ReportType { general, religious, quran }

class MockReportSubject {
  final String name;
  final int score;

  const MockReportSubject({required this.name, required this.score});
}

class MockReport {
  final ReportType type;
  final String semester;
  final List<MockReportSubject> subjects;

  const MockReport({
    required this.type,
    required this.semester,
    required this.subjects,
  });
}

class MockReportData {
  static final List<MockReport> reports = [
    MockReport(
      type: ReportType.general,
      semester: 'Semester Ganjil 2025',
      subjects: [
        MockReportSubject(name: 'Matematika', score: 85),
        MockReportSubject(name: 'Bahasa Indonesia', score: 88),
        MockReportSubject(name: 'Bahasa Inggris', score: 82),
        MockReportSubject(name: 'IPA', score: 80),
        MockReportSubject(name: 'Kimia', score: 80),
        MockReportSubject(name: 'Coding', score: 80),
        MockReportSubject(name: 'Fisika', score: 80),
        MockReportSubject(name: 'PKN', score: 80),
        MockReportSubject(name: 'Olahraga', score: 80),
        MockReportSubject(name: 'Multimdia', score: 80),
        MockReportSubject(name: 'SKI', score: 80),
        MockReportSubject(name: 'IPS', score: 80),
      ],
    ),
    MockReport(
      type: ReportType.religious,
      semester: 'Semester Ganjil 2025',
      subjects: [
        MockReportSubject(name: 'Tafsri', score: 86),
        MockReportSubject(name: 'Hadish', score: 90),
        MockReportSubject(name: 'Tauhid', score: 81),
        MockReportSubject(name: 'FIkih', score: 96),
        MockReportSubject(name: 'Nahwu', score: 90),
        MockReportSubject(name: 'Sorof', score: 95),
        MockReportSubject(name: 'Balghah', score: 60),
        MockReportSubject(name: 'Ilmu Hadis', score: 90),
        MockReportSubject(name: 'Ilmu Tafsir', score: 89),
        MockReportSubject(name: 'Bahasa Arab', score: 98),
        MockReportSubject(name: 'Sejarah', score: 60),
        MockReportSubject(name: 'Faroid', score: 80),
      ],
    ),
    MockReport(
      type: ReportType.quran,
      semester: 'Semester Ganjil 2025',
      subjects: [
        MockReportSubject(name: 'Kefasehan', score: 88),
        MockReportSubject(name: 'Hafalan', score: 85),
        MockReportSubject(name: 'Tajwid', score: 85),
        MockReportSubject(name: 'Tilawah', score: 87),
      ],
    ),
  ];
}
