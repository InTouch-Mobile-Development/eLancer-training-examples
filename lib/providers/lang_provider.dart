import 'package:e_lancer/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String langauge = SharedPrefController().langauge;

  void changeLangauge() {
    langauge = langauge == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLangauge(langauge: langauge);
    notifyListeners();
  }
}
