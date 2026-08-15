import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:project_2/core/constants/app_colors.dart';

class LocationBtn extends StatelessWidget {
  const LocationBtn({
    super.key,
    required this.mapController,
    required this.technicianLocation,
  });

  final MapController mapController;
  final LatLng technicianLocation;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(14.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(14.r),
        onTap: () {
          mapController.move(technicianLocation, 16);
        },
        child: SizedBox(
          width: 64.w,
          height: 64.h,
          child: Icon(
            Icons.my_location_rounded,
            color: AppColors.primary,
            size: 30.sp,
          ),
        ),
      ),
    );
  }
}
