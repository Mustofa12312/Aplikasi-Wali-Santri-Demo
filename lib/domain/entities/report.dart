enum ReportType { general, religious, quran }

class ReportSubject {
  final String name;
  final int score;

  const ReportSubject({required this.name, required this.score});
}

class Report {
  final ReportType type;
  final String semester;
  final List<ReportSubject> subjects;

  const Report({
    required this.type,
    required this.semester,
    required this.subjects,
  });

  double get averageScore {
    if (subjects.isEmpty) return 0;
    final total = subjects.fold<int>(0, (sum, s) => sum + s.score);
    return total / subjects.length;
  }
}
