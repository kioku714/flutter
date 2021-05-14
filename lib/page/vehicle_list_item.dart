import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handle/model/vehicle.dart';
import 'package:handle/page/vehicle_detail.dart';
import 'package:intl/intl.dart';

class VehicleListItem extends StatelessWidget {
  const VehicleListItem({Key key, this.vehicle, this.index}) : super(key: key);

  final Vehicle vehicle;
  final int index;

  @override
  Widget build(BuildContext context) => InkWell(
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
              CachedNetworkImage(
                imageUrl: vehicle.images[0].url,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  (index + 1).toString() +
                      '. ' +
                      vehicle.model +
                      ' ' +
                      vehicle.badgeDetail,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      numberWithComma(vehicle.mileage) + 'km',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      numberWithComma(vehicle.price) + '만원',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

String numberWithComma(int param) {
  return NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');
}