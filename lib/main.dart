import 'package:e_lancer/prefs/shared_pref_controller.dart';
import 'package:e_lancer/screens/launch_screen.dart';
import 'package:e_lancer/screens/login_screen.dart';
import 'package:e_lancer/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Do
  await SharedPrefController().initSharedPref();
  // End
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,

      locale: const Locale('ar'),
      initialRoute: "/launch_screen",
      routes: {
        "/launch_screen": (context) => LaunchScreen(),
        "/login_screen": (context) => LoginScreen(),
        "/main_screen": (context) => MainScreen(),
      },
    );
  }
}
