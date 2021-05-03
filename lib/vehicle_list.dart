import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handle/vehicle_detail.dart';
import 'package:http/http.dart' as http;

import 'model/vehicle.dart';
import 'model/vehicle_image.dart';

class VehicleListPage extends StatefulWidget {
  VehicleListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VehicleListPage createState() => _VehicleListPage();
}

Future<List<Vehicle>> fetchVehicle(http.Client client) async {
  var url = Uri.parse('https://clghks.pythonanywhere.com/vehicle');
  final response =
      await client.get(url, headers: {"Content-Type": "application/json"});

  return compute(parseVehicle, utf8.decode(response.bodyBytes));
}

List<Vehicle> parseVehicle(String responseBody) {
  var responseData = json.decode(responseBody);
  final parsed = responseData['results'].cast<Map<String, dynamic>>();

  return parsed.map<Vehicle>((json) => Vehicle.fromJson(json)).toList();
}

class _VehicleListPage extends State<VehicleListPage> {
  Widget cardViewWidget() {
    return FutureBuilder<List<Vehicle>>(
      future: fetchVehicle(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Vehicle vehicle = snapshot.data[index];
                List<VehicleImage> images = vehicle.images;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehicleDetailPage(title: '상세화면')),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(images[0].url),
                              Text(
                                (index + 1).toString() + '. ' + vehicle.model + ' ' + vehicle.badgeDetail,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                vehicle.price.toString(),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      )),
                );
              }
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: cardViewWidget(),
      )
    );
  }
}
