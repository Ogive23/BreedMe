import 'package:breed_me/Custom%20Widgets/custom_drawer.dart';
import 'package:breed_me/Screens/ArticlesScreens/articles_screen.dart';
import 'package:breed_me/Screens/ConsultationScreens/consultations_screen.dart';
import 'package:breed_me/Screens/PetScreens/pets_screen.dart';
import 'package:breed_me/Screens/PlacesScreens/places_screen.dart';
import 'package:breed_me/Screens/RequestScreens/requests_screen.dart';
import 'package:breed_me/Screens/SideScreens/profile_screen.dart';
import 'package:breed_me/Screens/SideScreens/settings_screen.dart';
import 'package:breed_me/Screens/SideScreens/stay_in_touch_screen.dart';
import 'package:breed_me/Shared%20Data/app_language.dart';
import 'package:breed_me/Shared%20Data/app_theme.dart';
import 'package:breed_me/Shared%20Data/common_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // int _index = 2;
  CommonData commonData;
  AppLanguage appLanguage;
  AppTheme appTheme;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;
  final pageOptions = [
    PlacesScreen(),
    ConsultationsScreen(),
    PetsScreen(),
    RequestsScreen(),
    ArticlesScreen(),
    SettingsScreen(),
    ProfileScreen(),
    StayInTouchScreen(),
  ];
  final pageFloatingPointIcons = [
    Icons.add_location_alt,
    Icons.post_add,
    Icons.add,
  ];
  Future<bool> _onWillPop(context) async {
    return commonData.lastStep()?(await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )):commonData.back();
  }
  @override
  Widget build(BuildContext context) {
    commonData = Provider.of<CommonData>(context);
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white.withOpacity(1.0),
            drawer:commonData.step > 4
                ? SizedBox()
                : CustomDrawer(),
            floatingActionButton:
            commonData.step == 0 || commonData.step == 1 || commonData.step == 2
                ? FloatingActionButton(
              onPressed: () {
                switch (commonData.step) {
                  case 0:
                    Navigator.pushNamed(context, "PlaceRequest");
                    break;
                  case 1:
                    Navigator.pushNamed(context, "ConsultationCreation");
                    break;
                  case 2:
                    Navigator.pushNamed(context, "PetCreation");
                    break;
                  default:
                    break;
                }
              },
              backgroundColor: Colors.white,
              child: Icon(
                pageFloatingPointIcons[commonData.step],
                color: Colors.black,
              ),
              mini: true,
            )
                : SizedBox(),
            body: pageOptions[commonData.step],
            bottomNavigationBar: new Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
              ),
              child: commonData.step > 4
                  ? SizedBox()
                  : BottomNavigationBar(
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.black.withOpacity(0.5),
                  onTap: (value) => commonData.changeStep(value),
                  currentIndex: commonData.step,
                  elevation: 0.0,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_on),
                      label: 'Places',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.contact_support),
                        label: 'Consultations'),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesome5Solid.dog), label: 'Pets'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.request_page), label: 'Requests'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.article), label: 'Articles'),
                  ]),
            )));
  }
}