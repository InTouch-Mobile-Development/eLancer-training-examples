import 'package:e_lancer/prefs/shared_pref_controller.dart';
import 'package:e_lancer/providers/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextcontroller;
  late TextEditingController _PasswordTextcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextcontroller = TextEditingController();
    _PasswordTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextcontroller.dispose();
    _PasswordTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<LanguageProvider>(context, listen: false)
              .changeLangauge();
        },
        child: const Icon(Icons.language),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
        centerTitle: true,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        children: [
          Text(
            AppLocalizations.of(context)!.welcome,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _emailTextcontroller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: const Icon(Icons.email),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _PasswordTextcontroller,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.password,
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => performLogin(),
              child: Text(AppLocalizations.of(context)!.login),
              style: ElevatedButton.styleFrom(minimumSize: const Size(0, 50))),
        ],
      ),
    );
  }

  void performLogin() {
    if (chechData()) {
      return login();
    }
  }

  bool chechData() {
    if (_emailTextcontroller.text.isNotEmpty &&
        _PasswordTextcontroller.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void login() async {
    await SharedPrefController().save(email: _emailTextcontroller.text);
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }
}
