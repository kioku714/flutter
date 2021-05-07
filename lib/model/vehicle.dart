import 'vehicle_image.dart';

class Vehicle {
  final int id;
  final List<VehicleImage> images;
  final String manufacturer;
  final String model;
  final String modelGroup;
  final String badge;
  final String badgeDetail;
  final String transmission;
  final String fuel;
  final int year;
  final String officeCity;
  final int mileage;
  final int price;
  final bool trust;

  Vehicle(
      {this.id,
      this.images,
      this.manufacturer,
      this.model,
      this.modelGroup,
      this.badge,
      this.badgeDetail,
      this.transmission,
      this.fuel,
      this.year,
      this.officeCity,
      this.mileage,
      this.price,
      this.trust});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    var list = json['image'] as List;
    List<VehicleImage> images =
        list.map((e) => VehicleImage.fromJson(e)).toList();

    return Vehicle(
      id: json['id'] as int,
      images: images,
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      modelGroup: json['model_group'] as String,
      badge: json['badge'] as String,
      badgeDetail: json['badge_detail'] as String,
      transmission: json['transmission'] as String,
      fuel: json['fuel'] as String,
      year: json['year'] as int,
      officeCity: json['office_city'] as String,
      mileage: json['mileage'] as int,
      price: json['price'] as int,
      trust: json['trust'] as bool,
    );
  }
}
