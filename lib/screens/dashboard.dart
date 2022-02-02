import '/repositories/data_repository.dart';
import '/repositories/endpoints_data.dart';
import '/services/api.dart';
import '/ui_widgets/endpoint_card.dart';
import '/ui_widgets/last_updated_status_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';
import '../services/globals.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    super.initState();
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    _endpointsData = dataRepository.getAllEndpointsCachedData();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final endpointsData = await dataRepository.getAllEndpointsData();
      setState(() => _endpointsData = endpointsData);
    } on SocketException {
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text("No Internet connection!")));
    } on HttpException {
      snackbarKey.currentState?.showSnackBar(
          SnackBar(content: Text("Couldn't find the requested data!")));
    } on FormatException {
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text("Bad response format!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedDateFormatter(
      lastUpdated: _endpointsData != null
          ? _endpointsData.values[Endpoint.cases]?.date
          : null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).app_title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: Color(0xffea4b4b),
            ),
            onPressed: () => {Navigator.pushNamed(context, '/settings')},
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            LastUpdatedStatusText(
              text: formatter.lastUpdatedStatusText(
                  AppLocalizations.of(context).last_updated),
            ),
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint]?.value
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
