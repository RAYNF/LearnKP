import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/ui/splashscreen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    child: const MyApp(),
    supportedLocales: const [Locale('id'), Locale('en', 'US')],
    path: 'assets/translations',
    startLocale: const Locale('en','US'),
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
