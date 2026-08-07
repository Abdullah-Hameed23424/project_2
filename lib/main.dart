import 'dart:async';
import 'dart:developer';
import 'package:project_2/core/helper/cache_helper.dart';
import 'package:flutter/foundation.dart';

import 'package:project_2/core/api/network_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/error/error_reporter/error_reporter.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/routing/routes.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/routing/navigation_service.dart';
import 'package:project_2/core/storage/app_storage.dart';
import 'package:project_2/core/utils/device_type.dart';
import 'package:project_2/core/localization/cubit/localization_cubit.dart';

import 'package:sentry/sentry.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  await Sentry.init(
    (options) {
      options.dsn =
          'https://ca9889e78ce588a9500b0f02071e8a5c@o4510816100810752.ingest.de.sentry.io/4511020343099472(TOREMOVE)'; //TODO: Remove'(TOREMOVE)' after testing
      options.sendDefaultPii = false;
      options.attachStacktrace = true;
      options.tracesSampleRate = 1.0;
      options.environment = kReleaseMode ? 'production' : 'debug';
      options.debug = true;
      options.diagnosticLevel = SentryLevel.debug;
      options.maxBreadcrumbs = 100;
    },
    appRunner: () async {
      WidgetsFlutterBinding.ensureInitialized();
      await _initializeServices();
      FlutterError.onError = (details) async {
        FlutterError.presentError(details);
        await ErrorReporter.report(
          details.exception,
          details.stack ?? StackTrace.current,
          feature: 'FlutterError',
          level: 'fatal',
        );
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        ErrorReporter.report(
          error,
          stack,
          feature: 'AsyncError',
          level: 'fatal',
        );
        return true;
      };

      runApp(const MyApp());
    },
  );
}

/// Initialize all required services
Future<void> _initializeServices() async {
  await CacheHelper.init();
  await NetworkClient.init();

  // AppStorage.removeLocale();
  _logDebugInfo();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.primary,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
}

void _logDebugInfo() async {
  log('Token: ${await AppStorage.getToken}');
  log('Has token: ${await AppStorage.hasToken}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()..init()),
        // BlocProvider(create: (context) => AuthCubit()),
      ],
      child: ScreenUtilInit(
        designSize: getFluidDeviceSize(context),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            BlocBuilder<LocalizationCubit, LocalizationState>(
              builder: (context, state) {
                final LocalizationCubit cubit = context
                    .read<LocalizationCubit>();
                return MaterialApp(
                  navigatorKey: NavigationService.navigatorKey,
                  navigatorObservers: [NavigationService.routeObserver],
                  theme: AppTheme.lightTheme(context),
                  debugShowCheckedModeBanner: false,
                  locale: const Locale('en'), //cubit.appLocale,
                  localizationsDelegates: localizationsDelegates,
                  supportedLocales: _buildSupportedLocales(),
                  routes: AppRoutes.getRoutes(),
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  // home: const CustomerServicesScreen(),
                  // home: const VerificationScreen(),
                  initialRoute: Routes.splashScreen,
                );
              },
            ),
      ),
    );
  }

  List<Locale> _buildSupportedLocales() {
    return languages
        .map((language) => Locale(language.languageCode, language.languageName))
        .toList();
  }
}
