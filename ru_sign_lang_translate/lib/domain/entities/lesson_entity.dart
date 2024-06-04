class LessonEntity {
  LessonEntity({
    this.id = 0,
    required this.nameGesture,
    required this.valueGesture,
    required this.url,
  });

  final int id;
  final String nameGesture;
  final String valueGesture;
  final String url;
}
