import 'package:flutter/material.dart';
import 'package:project_2/core/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(title, style: context.bodyMedium16),
    );
  }
}
