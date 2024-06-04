import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/domain/entities/lesson_entity.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({
    super.key,
    required this.title,
    required this.lesson,
    this.lessonClicked,
  });

  final String title;
  final LessonEntity lesson;
  final VoidCallback? lessonClicked;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: lessonClicked,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                _buildDivider(),
                _buildNameLesson(),
              ],
            ),
          ),
        ),
      );

  Widget _buildTitle() => Text(
        '$title',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.onAccent),
      );

  Widget _buildDivider() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: 1,
      color: AppColors.gray2,
      height: 32,
    ),
  );

  Widget _buildNameLesson() => Text(
        lesson.nameGesture,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: AppColors.onAccent),
      );
}
