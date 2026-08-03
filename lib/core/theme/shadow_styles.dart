import 'package:flutter/material.dart';

/// [ShadowStyles]
class ShadowStyles {
  static List<BoxShadow>? generalBoxShadow = <BoxShadow>[
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow>? lightBlackSpreading24Down12 = <BoxShadow>[
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];
}
