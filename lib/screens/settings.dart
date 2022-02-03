import 'package:coronavirus_rest_api_flutter_course/providers/locale_provider.dart';
import 'package:coronavirus_rest_api_flutter_course/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static String getLangFlag(String code) {
    switch (code) {
      case 'ar':
        return '🇸🇦     العربية';
      case 'hi':
        return '🇮🇳     हिन्दी';
      case 'es':
        return '🇪🇸     Español';
      case 'de':
        return '🇩🇪     Deutsch';
      case 'zh':
        return '🇨🇳    中国人';
      case 'en':
      default:
        return '🇺🇸     English';
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final locale = localeProvider.locale ?? Locale('en');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings_title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              " ${AppLocalizations.of(context).language} :",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).textTheme.headline5.color,
                      width: 4)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                    value: locale,
                    isExpanded: true,
                    items: AppLocalizations.supportedLocales.map((locale) {
                      final flag = getLangFlag(locale.languageCode);
                      return DropdownMenuItem(
                        child: Text(flag,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .color)),
                        value: locale,
                        onTap: () {
                          localeProvider.setLocale(locale);
                        },
                      );
                    }).toList(),
                    onChanged: (_) {}),
              ),
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Text(
                  " ${AppLocalizations.of(context).theme} :     ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '☀️',
                  style: TextStyle(fontSize: 20),
                ),
                Switch.adaptive(
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) {
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      themeProvider.toggleTheme(value);
                    }),
                Text('🌑', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
