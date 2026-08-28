import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    as flutter_localizations;
import 'package:multi_language/controller/language_change_controller.dart';
import 'package:multi_language/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

enum Language { english, spanish, urdu }

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

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
                  } else if (Language.spanish.name == item.name) {
                    provider.changeLanguage(Locale('es'));
                  } else {
                    provider.changeLanguage(Locale('ur'));
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

                      PopupMenuItem(value: Language.urdu, child: Text('اردو')),
                    ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localization.welcome,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            Text(
              localization.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: localization.name,
                border: const OutlineInputBorder(),
              ),
            ),


            Text(
              localization.email,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(localization.cancel),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(localization.save),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
