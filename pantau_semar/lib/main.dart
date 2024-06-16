import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/splashscreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Locale> getSavedLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? languageCode = prefs.getString('languageCode');
  String? countryCode = prefs.getString('countryCode');

  if (languageCode != null) {
    return Locale(languageCode, countryCode == '' ? null : countryCode);
  }

  return const Locale('en', 'US');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  Locale savedLocale = await getSavedLanguage();

  runApp(EasyLocalization(
    child: const MyApp(),
    supportedLocales: const [Locale('id'), Locale('en', 'US')],
    path: 'assets/translations',
    startLocale: savedLocale,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PantauSemar',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),
    );
  }
}
