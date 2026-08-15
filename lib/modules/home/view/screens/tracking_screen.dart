import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/modules/home/view/widgets/customer_marker.dart';
import 'package:project_2/modules/home/view/widgets/location_btn.dart';
import 'package:project_2/modules/home/view/widgets/status_banner.dart';
import 'package:project_2/modules/home/view/widgets/technician_card.dart';
import 'package:project_2/modules/home/view/widgets/technician_marker.dart';
import 'package:project_2/modules/home/view/widgets/tracking_top_bar.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final MapController _mapController = MapController();

  /// Example location.
  /// You can replace these coordinates with your customer's location.
  final LatLng _customerLocation = const LatLng(33.5138, 36.2765);

  /// Simulated technician route.
  final List<LatLng> _route = const [
    LatLng(33.5200, 36.2850),
    LatLng(33.5192, 36.2838),
    LatLng(33.5183, 36.2825),
    LatLng(33.5174, 36.2810),
    LatLng(33.5165, 36.2796),
    LatLng(33.5156, 36.2782),
    LatLng(33.5148, 36.2772),
    LatLng(33.5138, 36.2765),
  ];
  late LatLng _technicianLocation;
  Timer? _trackingTimer;
  int _currentRouteIndex = 0;

  @override
  void initState() {
    super.initState();
    _technicianLocation = _route.first;
    _startDemoTracking();
  }

  void _startDemoTracking() {
    _trackingTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (!mounted) return;
      if (_currentRouteIndex < _route.length - 1) {
        _currentRouteIndex++;
        setState(() {
          _technicianLocation = _route[_currentRouteIndex];
        });
        _mapController.move(_technicianLocation, 15.5);
      } else {
        _currentRouteIndex = 0;
        setState(() {
          _technicianLocation = _route.first;
        });
      }
    });
  }

  @override
  void dispose() {
    _trackingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppStatusBarTheme.lightnessStatusBar,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            /// MAP
            Positioned.fill(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: _customerLocation,
                  initialZoom: 15.5,
                  minZoom: 10,
                  maxZoom: 19,
                  interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.all,
                  ),
                ),
                children: <Widget>[
                  /// MAP TILES
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.project.project_2',
                  ),

                  /// ROUTE
                  PolylineLayer(
                    polylines: <Polyline>[
                      Polyline(
                        points: _route,
                        strokeWidth: 5,
                        color: AppColors.primary,
                      ),
                    ],
                  ),

                  /// MARKERS
                  MarkerLayer(
                    markers: <Marker>[
                      /// Customer marker
                      Marker(
                        point: _customerLocation,
                        width: 55.w,
                        height: 55.h,
                        child: const CustomerMarker(),
                      ),

                      /// Technician marker
                      Marker(
                        point: _technicianLocation,
                        width: 65.w,
                        height: 65.h,
                        child: const TechnicianMarker(),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// TOP UI
            SafeArea(
              child: Column(
                children: <Widget>[
                  const TrackingTopBar(),
                  SizedBox(height: 8.h),
                  const StatusBanner(),
                ],
              ),
            ),

            /// CURRENT LOCATION BUTTON
            Positioned(
              right: 16.w,
              bottom: 220.h,
              child: LocationBtn(
                mapController: _mapController,
                technicianLocation: _technicianLocation,
              ),
            ),

            /// TECHNICIAN CARD
            Positioned(
              left: 12.w,
              right: 12.w,
              bottom: 16.h,
              child: const TechnicianCard(),
            ),
          ],
        ),
      ),
    );
  }
}
