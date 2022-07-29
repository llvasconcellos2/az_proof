import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/az_theme.dart';
import 'app/data/preferences/user_preferences.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(
    GetMaterialApp(
      title: "AZ Proof",
      debugShowCheckedModeBanner: false,
      initialRoute: await authenticate(),
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Nunito Sans',
        appBarTheme: const AppBarTheme(color: AzTheme.red),
      ),
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(seconds: 0),
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}

Future<String> authenticate() async {
  final user = UserPreferences();
  String value = await user.getToken();

  return value.trim().isEmpty ? Routes.kLogin : Routes.kHome;
}
