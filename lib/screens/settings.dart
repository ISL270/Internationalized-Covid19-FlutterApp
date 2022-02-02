import 'package:coronavirus_rest_api_flutter_course/providers/locale_provider.dart';
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
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings_title),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xff616161), width: 4)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: locale,
                  isExpanded: true,
                  items: AppLocalizations.supportedLocales.map((locale) {
                    final flag = getLangFlag(locale.languageCode);
                    return DropdownMenuItem(
                      child: Text(flag,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff575757))),
                      value: locale,
                      onTap: () {
                        final provider =
                            Provider.of<LocaleProvider>(context, listen: false);

                        provider.setLocale(locale);
                      },
                    );
                  }).toList(),
                  onChanged: (_) {}),
            ),
          ),
        ],
      ),
    );
  }
}
