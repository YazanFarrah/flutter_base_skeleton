import 'dart:developer';

import 'package:anime_app/config/app_themes.dart';
import 'package:anime_app/core/providers/app_theme.dart';
import 'package:anime_app/core/routes/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        Future.delayed(
          Duration.zero,
          () async {
            // await Hive.close();
            log("inactive app ");
          },
        );
        break;
      case AppLifecycleState.resumed:
        Future.delayed(
          Duration.zero,
          () {
            // sl<AppSettingsCubit>().handleAppUpdate();
            // await di.openHiveBoxes();
            log("resume app");
          },
        );
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) async {});
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  Future<void> dispose() async {
    Future.delayed(
      Duration.zero,
      () async {
        await Hive.close();
      },
    );
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: '',
        themeMode: context.watch<ThemeProvider>().isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        builder: (context, child) {
          final Overlay overlay = Overlay(
            initialEntries: <OverlayEntry>[
              if (child != null)
                OverlayEntry(
                  builder: (BuildContext ctx) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: const TextScaler.linear(1.0),
                      ),
                      child: child,
                    );
                  },
                ),
            ],
          );
          return overlay;
        },
        routerConfig: AppRouter().router,
      ),
    );
  }
}
