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
          final locale = provider.appLocale ?? localLanguage;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',


            locale: locale,

            localizationsDelegates: const [
              AppLocalizations.delegate,
              flutter_localizations.GlobalMaterialLocalizations.delegate,
              flutter_localizations.GlobalWidgetsLocalizations.delegate,
              flutter_localizations.GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: const [
              Locale('en'),
              Locale('es'),
              Locale('ur'),
              Locale('hi'),
            ],

            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
              ),
            ),


            // 👇 Add this for urdu that start from right side and other language start from the left side
            builder: (context, child) {
              return Directionality(
                textDirection: locale.languageCode == 'ur' || locale.languageCode == 'hi'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: child!,
              );
            },
            home: const Homepage(),
          );
        },
      ),
    );
  }
}
