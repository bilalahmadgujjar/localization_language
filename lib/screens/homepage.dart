import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    as flutter_localizations;
import 'package:multi_language/controller/language_change_controller.dart';
import 'package:multi_language/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

enum Language { english, spanish, urdu, hindi }

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(AppLocalizations.of(context)!.helloWorld,style: TextStyle(color: Colors.white),),

        actions: [
          Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return PopupMenuButton(
                color: Colors.white,
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    provider.changeLanguage(Locale('en'));
                  } else if (Language.spanish.name == item.name) {
                    provider.changeLanguage(Locale('es'));
                  } else if (Language.urdu.name == item.name) {
                    provider.changeLanguage(Locale('ur'));
                  }
                  else
                    {
                      provider.changeLanguage(Locale('hi'));
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

                      PopupMenuItem(
                        value: Language.hindi,
                        child: Text('हिन्दी'),
                      ),
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
              controller: nameTextController,
              decoration: InputDecoration(
                hintText: localization.name,
                border: const OutlineInputBorder(),
              ),
              onChanged: (value)
              {
                print(value);
              },
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
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(localization.cancel),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
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
