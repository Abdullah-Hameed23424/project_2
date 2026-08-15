import 'package:flutter/material.dart';

class ProfileOptionModel {
  final IconData iconData;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  ProfileOptionModel({
    required this.iconData,
    required this.title,
    this.subtitle,
    required this.onTap,
  });
}
