
import 'package:breed_me/Session/session_manager.dart';
import 'package:breed_me/Shared%20Data/app_language.dart';
import 'package:breed_me/Shared%20Data/app_theme.dart';
import 'package:breed_me/Shared%20Data/common_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../GeneralInfo.dart';
import '../drawer_screen.dart';

class BackgroundScreen extends StatefulWidget {
  @override
  _BackgroundScreenState createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [DrawerScreen(), HomeScreen()],
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _index = 2;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double w, h;
  bool scaled = false;
  CommonData commonData;
  AppLanguage appLanguage;
  AppTheme appTheme;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  SessionManager sessionManager = new SessionManager();
  TabController tabController;

  final pageTitles = [
    'Places',
    'Consultations',
    'Pets',
    'Requests',
    'Articles',
    'Settings',
    'Profile',
    'StayInTouch'
  ];
  final pageFloatingPointIcons = [
    Icons.add_location_alt,
    Icons.post_add,
    Icons.add,
  ];

  Future<bool> _onWillPop(context) async {
    return commonData.lastStep()
        ? (await showDialog(
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
          ))
        : commonData.back();
  }

  @override
  Widget build(BuildContext context) {
    commonData = Provider.of<CommonData>(context);
    appTheme = Provider.of<AppTheme>(context);
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Scaffold(
                key: scaffoldKey,
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.menu,color: appTheme.themeData.iconTheme.color,),
                    onPressed: () {
                      setState(() {
                        if (scaled) {
                          xOffset = w / 2;
                          yOffset = h / 5;
                          scaleFactor = 0.6;
                        } else {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                        }
                        scaled = !scaled;
                      });
                    },
                  ),
                  title: Text('${pageTitles[commonData.step]}',style: appTheme.themeData.textTheme.body1,),
                  actions: [CircleAvatar(backgroundImage: NetworkImage(sessionManager.user.image,))],
                  backgroundColor: appTheme.themeData.backgroundColor,
                  elevation: 0.0,
                ),
                backgroundColor: Colors.white,
                // floatingActionButton: commonData.step == Pages.PlacesScreen.index ||
                //         commonData.step == Pages.Consultations.index ||
                //         commonData.step == Pages.PetsScreen.index
                //     ? FloatingActionButton(
                //         onPressed: () {
                //           switch (commonData.step) {
                //             case Pages.PlacesScreen.index:
                //               Navigator.pushNamed(context, "PlaceRequest");
                //               break;
                //             case Pages.Consultations.index:
                //               Navigator.pushNamed(
                //                   context, "ConsultationCreation");
                //               break;
                //             case Pages.PetsScreen.index:
                //               Navigator.pushNamed(context, "PetCreation");
                //               break;
                //             default:
                //               break;
                //           }
                //         },
                //         backgroundColor: Colors.white,
                //         child: Icon(
                //           pageFloatingPointIcons[commonData.step],
                //           color: Colors.black,
                //         ),
                //         mini: true,
                //       )
                //     : SizedBox(),
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
                                  icon: Icon(FontAwesome5Solid.dog),
                                  label: 'Pets'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.request_page),
                                  label: 'Requests'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.article), label: 'Articles'),
                            ]),
                )),
        ));
  }
}
