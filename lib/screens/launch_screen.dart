import 'package:e_lancer/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String ruote =
          SharedPrefController().loggedIn ? '/main_screen' : '/login_screen';
      Navigator.pushReplacementNamed(context, ruote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent, Colors.blueGrey]),
        ),
        child: Text(AppLocalizations.of(context)!.welcome,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
