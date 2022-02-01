import 'dart:convert';
import 'dart:io';
import 'package:coronavirus_rest_api_flutter_course/app/services/endpoint_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import '../services/globals.dart';

class APIService {
  final API api;
  APIService(this.api);

  Future<String> getAccessToken() async {
    try {
      final response = await http.post(
        api.tokenUri(),
        headers: {'Authorization': 'Basic ${api.apiKey}'},
      );
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
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

  Future<EndpointData> getEndpointData({
    @required String accessToken,
    @required Endpoint endpoint,
  }) async {
    final uri = api.endpointUri(endpoint);
    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final Map<String, dynamic> endpointData = data[0];
        final String responseJsonKey = _responseJsonKeys[endpoint];
        final int value = endpointData[responseJsonKey];
        final String dateString = endpointData['date'];
        final date = DateTime.tryParse(dateString);
        if (value != null) {
          return EndpointData(value: value, date: date);
        }
      } else {
        snackbarKey.currentState?.showSnackBar(
            SnackBar(content: Text("There is no data to display.")));
      }
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

  static Map<Endpoint, String> _responseJsonKeys = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'data',
    Endpoint.casesConfirmed: 'data',
    Endpoint.deaths: 'data',
    Endpoint.recovered: 'data',
  };
}
