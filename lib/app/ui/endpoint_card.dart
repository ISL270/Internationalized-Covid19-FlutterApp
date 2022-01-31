import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName);
  final String title;
  final String assetName;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);
  final Endpoint endpoint;
  final int value;

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    Map<Endpoint, EndpointCardData> _cardsData = {
      Endpoint.cases: EndpointCardData(
          AppLocalizations.of(context).cases, 'assets/count.png'),
      Endpoint.casesSuspected: EndpointCardData(
          AppLocalizations.of(context).suspected_cases, 'assets/suspect.png'),
      Endpoint.casesConfirmed: EndpointCardData(
        AppLocalizations.of(context).confirmed_cases,
        'assets/fever.png',
      ),
      Endpoint.deaths: EndpointCardData(
          AppLocalizations.of(context).deaths, 'assets/death.png'),
      Endpoint.recovered: EndpointCardData(
          AppLocalizations.of(context).recovered_cases, 'assets/patient.png'),
    };
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8.0),
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                cardData.title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Color(0xff656565),
                    fontSize: 16,
                    fontFamily: 'PantonBoldItalic',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      cardData.assetName,
                      color: Color(0xffea4b4b),
                      height: 37,
                    ),
                    Text(
                      formattedValue,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Color(0xffea4b4b),
                          fontWeight: FontWeight.w300,
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
