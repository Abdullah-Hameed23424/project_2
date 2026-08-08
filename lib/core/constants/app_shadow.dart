import 'package:flutter/material.dart';

/// [AppShadow]
class AppShadow {
  static List<BoxShadow>? generalBoxShadow = <BoxShadow>[
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow>? cardShadow = <BoxShadow>[
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 8,
      offset: const Offset(0, 0),
    ),
  ];
}
