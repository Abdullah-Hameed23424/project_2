import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppStatusBarTheme.lightnessStatusBar,
      child: Scaffold(body: Container()),
    );
  }
}
