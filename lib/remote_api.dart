import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'model/vehicle.dart';
import 'model/vehicles.dart';

class RemoteApi {
  static Future<List<Vehicle>> getVehicles(
    int page,
  ) async =>
      http
          .get(
            _ApiUrlBuilder.vehicleList(page),
          )
          .mapFromResponse<List<Vehicle>, List<dynamic>>(
            (jsonArray) => _parseItemListFromJsonArray(
              jsonArray,
              (jsonObject) => Vehicle.fromJson(jsonObject),
            ),
          );

  static List<T> _parseItemListFromJsonArray<T>(
    List<dynamic> jsonArray,
    T Function(dynamic object) mapper,
  ) =>
      jsonArray.map(mapper).toList();
}

class GenericHttpException implements Exception {}

class NoConnectionException implements Exception {}

class _ApiUrlBuilder {
  static const _baseUrl = 'https://clghks.pythonanywhere.com/';
  static const _resource = 'vehicle';

  static Uri vehicleList(
      int page
  ) =>
      Uri.parse(
        '$_baseUrl$_resource?'
        'page=$page'
      );
}

extension on Future<http.Response> {
  Future<R> mapFromResponse<R, T>(R Function(T) jsonParser) async {
    try {
      final response = await this;
      if (response.statusCode == 200) {
        var data = json.decode(utf8.decode(response.bodyBytes));
        final results = data['results'].cast<Map<String, dynamic>>();

        return results.map<Vehicle>((json) => Vehicle.fromJson(json)).toList();
      } else {
        throw GenericHttpException();
      }
    } on SocketException {
      throw NoConnectionException();
    }
  }
}
