import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName, this.color);
  final String title;
  final String assetName;
  final Color color;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);
  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndpointCardData> _cardsData = {
    Endpoint.cases: EndpointCardData('Cases', 'assets/count.png', Color(0xFFFFF492)),
    Endpoint.casesSuspected:
        EndpointCardData('Suspected cases', 'assets/suspect.png', Color(0xFFEEDA28)),
    Endpoint.casesConfirmed:
        EndpointCardData('Confirmed cases', 'assets/fever.png', Color(0xFFE99600)),
    Endpoint.deaths: EndpointCardData('Deaths', 'assets/death.png', Color(0xFFE40000)),
    Endpoint.recovered: EndpointCardData('Recovered', 'assets/patient.png', Color(0xFF70A901)),
  };

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                cardData.title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Color(0xff656565), fontSize: 16, fontFamily: 'PantonBoldItalic'),
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
                          color: Color(0xffea4b4b), fontWeight: FontWeight.w300, fontSize: 28),
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
