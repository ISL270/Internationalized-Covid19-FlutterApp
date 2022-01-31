import 'package:coronavirus_rest_api_flutter_course/app/repositories/data_repository.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api_service.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/data_cache_service.dart';
import 'package:coronavirus_rest_api_flutter_course/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(API.sandbox()),
        dataCacheService: DataCacheService(
          sharedPreferences: sharedPreferences,
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) {
          return AppLocalizations.of(context).app_title;
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              color: Colors.white,
              titleTextStyle: TextStyle(
                  color: Color(0xffea4b4b),
                  fontFamily: 'PantonBoldItalic',
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: Color(0xFFF6F6F6),
          cardColor: Color(0xFFFFFFFF),
        ),
        home: Dashboard(),
      ),
    );
  }
}
