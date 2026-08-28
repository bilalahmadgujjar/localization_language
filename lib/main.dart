import 'package:flutter/material.dart';
import 'package:multi_language/controller/language_change_controller.dart';
import 'package:multi_language/l10n/app_localizations.dart';
import 'package:multi_language/screens/homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
as flutter_localizations;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sp = await SharedPreferences.getInstance();

  final String languageCode = sp.getString('language_code') ?? 'en';

  runApp(MyApp(
    localLanguage: Locale(languageCode),
  ));
}

class MyApp extends StatelessWidget {
  final Locale localLanguage;

  const MyApp({
    super.key,
    required this.localLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageChangeController(),
        ),
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',


            locale: provider.appLocale ?? localLanguage,

            localizationsDelegates: const [
              AppLocalizations.delegate,
              flutter_localizations.GlobalMaterialLocalizations.delegate,
              flutter_localizations.GlobalWidgetsLocalizations.delegate,
              flutter_localizations.GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: const [
              Locale('en'),
              Locale('es'),
            ],

            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
              ),
            ),

            home: const Homepage(),
          );
        },
      ),
    );
  }
}
