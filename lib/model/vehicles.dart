import 'vehicle.dart';

class Vehicles {
  final int count;
  final String next;
  final String previous;
  final List<Vehicle> results;

  Vehicles({this.count, this.next, this.previous, this.results});

  factory Vehicles.fromJson(Map<String, dynamic> json) {
    return Vehicles(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results']
    );
  }
}