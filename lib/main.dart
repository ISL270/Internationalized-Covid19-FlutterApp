import 'repositories/data_repository.dart';
import 'services/api.dart';
import 'services/api_service.dart';
import 'services/data_cache_service.dart';
import 'screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'services/globals.dart';
import 'providers/locale_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'en_GB';
  await findSystemLocale();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.sharedPreferences}) : super(key: key);
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<DataRepository>(
              create: (context) => DataRepository(
                    apiService: APIService(API.sandbox()),
                    dataCacheService: DataCacheService(
                      sharedPreferences: sharedPreferences,
                    ),
                  )),
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        builder: (context, child) {
          final localeProvider = Provider.of<LocaleProvider>(context);
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            scaffoldMessengerKey: snackbarKey,
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (context) {
              return AppLocalizations.of(context).app_title;
            },
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: localeProvider.locale,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            routes: {
              '/dashboard': (context) => const Dashboard(),
              '/settings': (context) => const Settings(),
            },
            initialRoute: '/dashboard',
          );
        });
  }
}
