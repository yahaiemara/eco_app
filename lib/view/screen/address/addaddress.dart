import 'package:ecommerceapptotrial/controller/address/address_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';


class Addaddress extends StatelessWidget {
  const Addaddress({super.key});
  @override
  Widget build(BuildContext context) {
    AddressController mapController = Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenStreetMap'),
      ),
      body: Container(
        child: GetBuilder<AddressController>(
          builder: (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FlutterMap(
                        mapController: mapController.mapController,
                        options: MapOptions(
                        initialCenter: mapController.center.value,
                          initialZoom: mapController.zoom.value,
                          onTap: (tapPosition, latlng) {
                            // تغيير موقع الـ marker عند الضغط على الخريطة
                            mapController.moveToLocation(latlng);
                          },
                        ),
                        children: [
                          OpenStreetMapTilelayer,
                          MarkerLayer(
                            markers: [
                              Marker(
                                
                                point: mapController.center.value,
                                width: 60,
                                height: 60,
                                child: const Icon(
                                  Icons.location_pin,
                                  color: AppColor.primaryColor,
                                  size: 60,
                                  
                                ),
                                
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: AppColor.primaryColor,
                          onPressed: () {
                             double latitude = mapController.center.value.latitude;
                             print("latTuid=============$latitude");
                             double longitude = mapController.center.value.longitude;
                             print("latTuid=============$longitude");

                          Get.toNamed(AppRoute.compeleteaddress,arguments: {
                           'lat': latitude.toString(),
                                'long': longitude.toString()
                          });
                            print(
                                'Latitude: ${mapController.center.value.latitude}, Longitude: ${mapController.center.value.longitude}');
                          },
                          child: const Text(
                            "Complete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
TileLayer get OpenStreetMapTilelayer => TileLayer(
      urlTemplate:
          "https://tile.openstreetmap.org/{z}/{x}/{y}.png?access_token=5b3ce3597851110001cf624854b5221f5dcc43be878b19087014e4ae",
      userAgentPackageName: 'com.example.ecommerceapptotrial',
    );
