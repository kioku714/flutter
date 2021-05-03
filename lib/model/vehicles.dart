import 'vehicle.dart';

class ResponseData {
  final int count;
  final String next;
  final String previous;
  final List<Vehicle> results;

  ResponseData({this.count, this.next, this.previous, this.results});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results']
    );
  }
}