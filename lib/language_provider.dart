import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const List<Map<String, dynamic>> languages = [
    {
      'name': 'English',
      'locale': 'en',
    },
    {
      'name': 'हिंदी',
      'locale': 'hi',
    },
    {
      'name': 'मराठी',
      'locale': 'mr',
    },
  ];

  static const String _languageKey = 'selected_language';

  Locale _selectedLocale = const Locale('en');

  LanguageProvider() {
    _loadLanguage();
  }

  Locale get selectedLocale => _selectedLocale;

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(_languageKey);
    if (languageCode != null) {
      _selectedLocale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> changeLanguage(String language) async {
    _selectedLocale = Locale(language);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }
}
