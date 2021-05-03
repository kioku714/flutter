
class VehicleImage {
  final int id;
  final String url;

  VehicleImage({this.id, this.url});

  factory VehicleImage.fromJson(Map<String, dynamic> json) {
    return VehicleImage(
      id: json['id'] as int,
      url: json['url'] as String
    );
  }
}