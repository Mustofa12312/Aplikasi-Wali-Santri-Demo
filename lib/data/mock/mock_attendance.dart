enum AttendanceStatus { hadir, izin, alfa }

class MockAttendance {
  final DateTime date;
  final AttendanceStatus status;

  const MockAttendance({required this.date, required this.status});
}

class MockAttendanceData {
  static final List<MockAttendance> records = [
    MockAttendance(date: DateTime(2025, 12, 1), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 2), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 3), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 4), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 5), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 6), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 7), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 8), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 9), status: AttendanceStatus.hadir),
    MockAttendance(
      date: DateTime(2025, 12, 10),
      status: AttendanceStatus.hadir,
    ),
    MockAttendance(date: DateTime(2025, 12, 11), status: AttendanceStatus.izin),
    MockAttendance(date: DateTime(2025, 12, 12), status: AttendanceStatus.izin),
    MockAttendance(date: DateTime(2025, 12, 13), status: AttendanceStatus.izin),
    MockAttendance(date: DateTime(2025, 12, 3), status: AttendanceStatus.izin),
    MockAttendance(date: DateTime(2025, 12, 4), status: AttendanceStatus.hadir),
    MockAttendance(date: DateTime(2025, 12, 5), status: AttendanceStatus.alfa),
  ];

  static int count(AttendanceStatus status) {
    return records.where((e) => e.status == status).length;
  }
}
