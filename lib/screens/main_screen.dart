import 'package:flutter/material.dart';
import 'package:e_lancer/prefs/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.main),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedPrefController().logout();
                Navigator.pushReplacementNamed(context, '/login_screen');
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Text(SharedPrefController().email),
      ),
    );
  }
}
