enum AttendanceStatus { hadir, izin, alfa }

class Attendance {
  final DateTime date;
  final AttendanceStatus status;

  const Attendance({required this.date, required this.status});

  bool get isHadir => status == AttendanceStatus.hadir;
  bool get isIzin => status == AttendanceStatus.izin;
  bool get isAlfa => status == AttendanceStatus.alfa;
}
