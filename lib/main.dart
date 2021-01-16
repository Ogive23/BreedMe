import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'articles_screen.dart';
import 'consultations_screen.dart';
import 'pets_screen.dart';
import 'places_screen.dart';
import 'requests_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breed Me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "SplashScreen": (BuildContext context) => SplashScreen(),
        "Login": (BuildContext context) => LoginScreen(),
        "SignUp": (BuildContext context) => SignUpScreen(),
        "ConsultationCreation": (BuildContext context) => FeedMeIntro(),
        "PetCreation": (BuildContext context) => FeedMe(),
        "PlaceRequest" : (BuildContext context) => MarkerCreation(),
        "Profile": (BuildContext context) => ProfilePage(),
//        "ReportProblem": (BuildContext context) => ReportProblemPage(),
        "StayInTouch": (BuildContext context) => StayInTouchPage(),

        //add more routes here
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 2;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  TabController tabController;
  @override
  void initState() {
    super.initState();
  }

  void _changePage(int _index) {
    setState(() {
      this._index = _index;
    });
  }

  final pageOptions = [
    PlacesScreen(),
    ConsultationsScreen(),
    PetsScreen(),
    RequestsScreen(),
    ArticlesScreen()
  ];
  final pageFloatingPointIcons = [
    Icons.add_location_alt,
    Icons.post_add,
    Icons.add,
  ];
  final pageTitles = [
    "Places",
    "Consultations",
    "Pets",
    "Requests",
    "Articles"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white.withOpacity(1.0),
        drawer: Drawer(child: Container()),
        floatingActionButton: _index == 0 || _index == 1 || _index == 2
            ? FloatingActionButton(
                onPressed: () {
                  switch(_index){
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
                  pageFloatingPointIcons[_index],
                  color: Colors.black,
                ),
                mini: true,
              )
            : SizedBox(),
        body: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                elevation: 1.0,
                forceElevated: true,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  '${pageTitles[_index]}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              pageOptions[_index],
            ]),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: BottomNavigationBar(
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.black.withOpacity(0.5),
              onTap: _changePage,
              currentIndex: _index,
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: 'Places',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contact_support), label: 'Consultations'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesome5Solid.dog), label: 'Pets'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.request_page), label: 'Requests'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.article), label: 'Articles'),
              ]),
        )
        // Stack(
        //   children: <Widget>[
        //     pageOptions[_index],
        //     Positioned(
        //       left: 5,
        //       top: 20,
        //       child: IconButton(
        //         icon: Icon(
        //           Icons.menu,
        //           color: Colors.white,
        //         ),
        //         onPressed: () => scaffoldKey.currentState.openDrawer(),
        //       ),
        //     ),
        //     Align(
        //         alignment: Alignment.bottomCenter,
        //         child: Theme(
        //           data:
        //               Theme.of(context).copyWith(canvasColor: Colors.transparent),
        //           child: BottomNavigationBar(
        //               selectedItemColor: Colors.amber,
        //               unselectedItemColor: Colors.white.withOpacity(0.5),
        //               type: BottomNavigationBarType.shifting,
        //               onTap: _changePage,
        //               currentIndex: _index,
        //               backgroundColor: Colors.blue,
        //               elevation: 0.0,
        //               items: [
        //                 BottomNavigationBarItem(
        //                   icon: Icon(Icons.location_on),
        //                   label: 'Places',
        //                 ),
        //                 BottomNavigationBarItem(
        //                     icon: Icon(Icons.contact_support),
        //                     label: 'Consultations'),
        //                 BottomNavigationBarItem(
        //                     icon: Icon(FontAwesome5Solid.dog), label: 'Pets'),
        //                 BottomNavigationBarItem(
        //                     icon: Icon(Icons.request_page), label: 'Requests'),
        //                 BottomNavigationBarItem(
        //                     icon: Icon(Icons.article), label: 'Articles'),
        //               ]),
        //         )) // This trailing comma makes)),
        //   ],
        // ),
        );
  }
}