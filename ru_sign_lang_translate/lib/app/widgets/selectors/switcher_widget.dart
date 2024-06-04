import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/domain/enums/lesson_type.dart';

class SwitcherWidget extends StatelessWidget {
  const SwitcherWidget({
    Key? key,
    required this.selectedLessonType,
    required this.onTap,
  }) : super(key: key);

  final LessonType selectedLessonType;
  final Function(LessonType) onTap;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.gray1,
          borderRadius: BorderRadius.circular(50),
        ),
        child: _buildButtons(context),
      );

  Widget _buildButtons(context) => Stack(
        children: [
          Positioned.fill(
            child: AnimatedAlign(
              alignment: selectedLessonType == LessonType.theory ? Alignment.centerLeft : Alignment.centerRight,
              duration: Duration(milliseconds: 250),
              child: Container(
                width: (MediaQuery.of(context).size.width - 56) / 2,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton(LessonType.theory, LessonType.theory.text),
              _buildButton(LessonType.practice, LessonType.practice.text),
            ],
          ),
        ],
      );

  Widget _buildButton(lessonType, title) => Expanded(
        child: GestureDetector(
          onTap: () => onTap.call(lessonType),
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: lessonType == selectedLessonType ? AppColors.onPrimary : AppColors.gray3,
              ),
            ),
          ),
        ),
      );
}
