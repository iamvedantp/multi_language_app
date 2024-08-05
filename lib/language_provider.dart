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

  static const String _languageKey =
      'selected_language'; // Key for storing language preference

  Locale _selectedLocale = const Locale('en'); // Default language

  LanguageProvider() {
    _loadLanguage(); // Load saved language preference on initialization
  }

  Locale get selectedLocale => _selectedLocale; // Getter for selected language

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode =
        prefs.getString(_languageKey); // Retrieve saved language
    if (languageCode != null) {
      _selectedLocale =
          Locale(languageCode); // Set locale if saved language is found
      notifyListeners();
    }
  }

  Future<void> changeLanguage(String language) async {
    _selectedLocale = Locale(language); // Update locale
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language); // Save selected language
  }
}
