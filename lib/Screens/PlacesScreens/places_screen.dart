import 'dart:async';

import 'package:breed_me/Models/user_location.dart';
import 'package:breed_me/Shared%20Data/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PlacesScreen extends StatelessWidget {
  GoogleMap googleMap;
  List<String> placesTypes = [
    'Vet',
    'Shop',
    'Shelter',
    'Not Shop',
    'Stop',
    'Clinic',
    'Food'
  ];
  AppTheme appTheme;
  // List<Marker> markers;
  UserLocation userLocation = new UserLocation();
  void onMarkerTapped(context, MarkerId markerId) {
    // Marker tappedMarker;
    // int i = 0;
    // for (; i < markers.length; i++) {
    //   if (markerId == markers.elementAt(i).markerId) {
    //     tappedMarker = markers.elementAt(i);
    //     break;
    //   }
    // }
    // if (tappedMarker != null) {
    //   showAlertDialog(context, i);
    // }
  }

  showAlertDialog(context, index) {
    // set up the buttons
    // Widget launchButton = FlatButton(
    //   child: Text("Go And Get IT!"),
    //   onPressed: () {
    //     Navigator.of(context).pop();
    //   },
    // );
    // Widget cancelButton = FlatButton(
    //   child: Text("Cancel"),
    //   onPressed: () async {
    //     Navigator.of(context).pop();
    //   },
    // );
    // // set up the AlertDialog
    // AlertDialog alert = AlertDialog(
    //   title: Text("${markers[index].infoWindow.title}"),
    //   content: Text(
    //     '\n${markers[index].infoWindow.snippet}',
    //   ),
    //   actions: [
    //     launchButton,
    //     cancelButton,
    //   ],
    // );
    // // show the dialog
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return alert;
    //   },
    // );
  }

  Future<GoogleMap> getGoogleMap(context) async {
    Completer<GoogleMapController> _controller = Completer();
    try {
      if (userLocation.getUserLocation() == null) {
        await userLocation.getUserLocation();
        throw new Exception();
      }
      // for (int i = 0; i < markers.length; i++) {
      //   markers[i] = markers.elementAt(i).copyWith(onTapParam: () {
      //     onMarkerTapped(context, markers.elementAt(i).markerId);
      //   });
      // }
      return googleMap = GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(29.9830269, 31.23815), zoom: 18),
        // initialCameraPosition: CameraPosition(
        //     target: LatLng(userLocation.getLatLng()[0],
        //         userLocation.getLatLng()[1]),
        //     zoom: 18),
        // markers: Set<Marker>.of(markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
        mapToolbarEnabled: true,
      );
    } on Exception {
      print('thing here here here');
    } catch (e) {
      print('thing ${e}');
    }
  }

  Widget showGoogleMap(context) {
    return FutureBuilder<GoogleMap>(
      future: getGoogleMap(context),
      builder: (BuildContext context, AsyncSnapshot<GoogleMap> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          print(snapshot.data);
          return googleMap;
        } else if (snapshot.error != null) {
          return Container(
            alignment: Alignment.center,
            child: Text(
                'Error Showing Google map, Please Restart ${snapshot.error}'),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CupertinoActionSheet(
              title: Text('Loading'),
              actions: [
                CupertinoActivityIndicator(
                  radius: 50,
                )
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    appTheme = Provider.of<AppTheme>(context);
    return Container(
      child: Column(
        children: [
          Container(),
          Expanded(child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Colors.deepOrange,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int index = 0; index < placesTypes.length; index++)
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            placesTypes[index],
                            style: appTheme.getTextStyle(
                                1.0,
                                Colors.white,
                                appTheme.getSemiBodyTextTheme(context),
                                FontWeight.normal,
                                TextDecoration.none),
                          ),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: showGoogleMap(context),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/shop.png',
                                  fit: BoxFit.fill,
                                  width: 120,
                                  height: 120,
                                ),
                              )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 100,
                        ),
                        Text.rich(
                          TextSpan(text: 'Pet Shop Name\n', children: [
                            TextSpan(
                                text: 'Maadi\n',
                                style: appTheme.getTextStyle(
                                    1.0,
                                    Colors.black,
                                    appTheme.getBodyTextTheme(context),
                                    FontWeight.normal,
                                    TextDecoration.none)),
                            getStars(2, context),
                          ]),
                          style: appTheme.getTextStyle(
                              1.0,
                              Colors.black,
                              appTheme.getSemiBodyTextTheme(context),
                              FontWeight.normal,
                              TextDecoration.none),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],),
          ))
        ],
      ),
    );
  }

  getStars(int i, context) {
    String stars = '';
    for (int index = 0; index < 5; index++) {
      if (index <= i)
        stars += '⭐';
      else
        stars += '☆';
    }
    return TextSpan(
        text: stars,
        style: appTheme.getTextStyle(
            1.0,
            Colors.black,
            appTheme.getBodyTextTheme(context),
            FontWeight.normal,
            TextDecoration.none));
  }
}
