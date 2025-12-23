enum AttendanceStatus { hadir, izin, alfa }

class MockAttendance {
  final DateTime date;
  final AttendanceStatus status;

  const MockAttendance({required this.date, required this.status});
}

class MockAttendanceData {
  static final List<MockAttendance> records = [
    MockAttendance(date: DateTime(2025, 9, 1), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 9, 2), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 9, 3), status: AttendanceStatus.izin),
    MockAttendance(date: DateTime(2025, 9, 4), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 9, 5), status: AttendanceStatus.alfa),
  ];

  static int count(AttendanceStatus status) {
    return records.where((e) => e.status == status).length;
  }
}
