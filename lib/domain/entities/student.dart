class Student {
  final String id;
  final String name;
  final String nis;
  final String room;
  final String generalClass;
  final String religiousClass;
  final String quranClass;
  final String guardianName;

  const Student({
    required this.id,
    required this.name,
    required this.nis,
    required this.room,
    required this.generalClass,
    required this.religiousClass,
    required this.quranClass,
    required this.guardianName,
  });

  Student copyWith({
    String? id,
    String? name,
    String? nis,
    String? room,
    String? generalClass,
    String? religiousClass,
    String? quranClass,
    String? guardianName,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      nis: nis ?? this.nis,
      room: room ?? this.room,
      generalClass: generalClass ?? this.generalClass,
      religiousClass: religiousClass ?? this.religiousClass,
      quranClass: quranClass ?? this.quranClass,
      guardianName: guardianName ?? this.guardianName,
    );
  }
}
