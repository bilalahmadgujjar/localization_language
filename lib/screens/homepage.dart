import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    as flutter_localizations;
import 'package:multi_language/controller/language_change_controller.dart';
import 'package:multi_language/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

enum Language { english, spanish }

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),

        actions: [

          Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return PopupMenuButton(
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    provider.changeLanguage(Locale('en'));
                  } else {
                    provider.changeLanguage(Locale('es'));
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Language>>[
                      PopupMenuItem(
                        value: Language.english,
                        child: Text('English'),
                      ),

                      PopupMenuItem(
                        value: Language.spanish,
                        child: Text('Spanish'),

                      ),
                    ],
              );
            },
          ),
        ],
      ),
      body: Column(children: []),
    );
  }
}
