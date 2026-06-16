import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/providers/navigation_provider.dart';
import 'package:hrx_app/core/providers/theme_provider.dart';
import 'package:hrx_app/core/utils/app_theme.dart';
import 'package:hrx_app/features/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'core/cache/shared_prefrence_utils.dart';
import 'core/di/service_locator.dart';
import 'core/utils/navigator_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferenceUtils.init();
  configureDependencies();
  await Future.delayed(const Duration(milliseconds: 100));

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Performix HRX',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeProvider.themeMode,
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}
