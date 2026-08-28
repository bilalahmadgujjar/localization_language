// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get helloWorld => 'नमस्ते दुनिया';

  @override
  String get welcome => 'स्वागत है';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get name => 'नाम';

  @override
  String get email => 'ईमेल';

  @override
  String get save => 'सहेजें';

  @override
  String get cancel => 'रद्द करें';
}
