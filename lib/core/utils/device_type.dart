// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';

// enum UserDeviceType {
//   mobile,
//   tablet,
//   laptop,
// }

// late double MAX_WIDTH;
// late double MAX_Height;

// Size getDeviceSize(BuildContext context) {
//   final double width = MediaQuery.of(context).size.width;

//   final bool isHighRes = width >= 2000;
//   final double factor = isHighRes ? 2 : 1;

//   if (width < 400) {
//     deviceType = UserDeviceType.mobile;
//     MAX_WIDTH = 430;
//     MAX_Height = 930;
//   } else if (width >= 400 && width < 800) {
//     deviceType = UserDeviceType.tablet;

//     MAX_WIDTH = 500;
//     MAX_Height = 700;
//   } else {
//     deviceType = UserDeviceType.laptop;

//     MAX_WIDTH = 600 * factor;
//     MAX_Height = 570 * factor;
//   }

//   return Size(MAX_WIDTH, MAX_Height);
// }

// late UserDeviceType deviceType;

import 'package:flutter/material.dart';

enum UserDeviceType {
  mobile,
  tablet,
  laptop,
}
 
late UserDeviceType deviceType;

Size getFluidDeviceSize(BuildContext context) {
  // 1. الحصول على عرض الشاشة الفعلي
  final double screenWidth = MediaQuery.of(context).size.width;
  // ignore: unused_local_variable
  final double screenHeight = MediaQuery.of(context).size.height;

  // 2. نقطة البداية (تصميم الموبايل الذي اعتمدته)
  const double baseWidth = 430;
  const double baseHeight = 930;

  // 3. معامل المرونة (Flexibility Factor)
  // إذا كان 0: التصميم سيكبر بشكل حرفي مع الشاشة (قد يصبح ضخماً جداً)
  // إذا كان 1: التصميم سيبقى ثابتاً (العناصر ستصغر جداً في الشاشات الكبيرة)
  // القيمة 0.6 هي "النقطة السحرية" للتوازن.
  double damping = 0.6;

  double dynamicWidth;
  double dynamicHeight;

  if (screenWidth <= baseWidth) {
    // إذا كانت الشاشة أصغر من تصميمك، نثبت التصميم المرجعي
    dynamicWidth = baseWidth;
    dynamicHeight = baseHeight;
  } else {
    // المعادلة السحرية: العرض المرجعي + (الفرق بين الشاشتين * معامل التخفيف)
    dynamicWidth = baseWidth + (screenWidth - baseWidth) * damping;

    // الحفاظ على التناسب الطولي (Aspect Ratio)
    double aspectRatio = baseHeight / baseWidth;
    dynamicHeight = dynamicWidth * aspectRatio;
  }

  // تحديد نوع الجهاز لأغراض برمجية أخرى (اختياري)
  _updateDeviceType(screenWidth);

  return Size(dynamicWidth, dynamicHeight);
}

void _updateDeviceType(double width) {
  if (width < 600) {
    deviceType = UserDeviceType.mobile;
  } else if (width < 1024) {
    deviceType = UserDeviceType.tablet;
  } else {
    deviceType = UserDeviceType.laptop;
  }
}
