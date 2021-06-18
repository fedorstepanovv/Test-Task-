import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_task/models/country.dart';

class DetailScreen extends StatelessWidget {
  final List<double> latLngs;
  final String numericCode;
  final List<Currency> currencies;
  final List<String> borders;

  const DetailScreen({
    Key key,
    @required this.latLngs,
    @required this.numericCode,
    @required this.currencies,
    @required this.borders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("City details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(latLngs[0], latLngs[1]),
                  zoom: 8.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(latLngs[0], latLngs[1]),
                        builder: (ctx) => Container(
                          child: FlutterLogo(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(numericCode),
            for (var i = 0; i < borders.length; i++)
                Text(borders[i]),
            for (var i = 0; i < currencies.length; i++)
                Text(currencies[i].name),
          ],
        ),
      ),
    );
  }
}
