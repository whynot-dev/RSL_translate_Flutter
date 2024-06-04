enum LessonType {
  theory(text: 'Теория'),
  practice(text: 'Практика');

  const LessonType({required this.text});

  final String text;
}
