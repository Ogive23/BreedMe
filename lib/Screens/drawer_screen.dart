import 'package:breed_me/Screens/SideScreens/settings_screen.dart';
import 'package:breed_me/Session/session_manager.dart';
import 'package:breed_me/Shared%20Data/app_language.dart';
import 'package:breed_me/Shared%20Data/app_theme.dart';
import 'package:breed_me/Shared%20Data/common_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  SessionManager sessionManager = new SessionManager();
  CommonData commonData;
  AppTheme appTheme;
  AppLanguage appLanguage;
  @override
  Widget build(BuildContext context) {
    commonData = Provider.of<CommonData>(context);
    appTheme = Provider.of<AppTheme>(context);
    appLanguage = Provider.of<AppLanguage>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: appTheme.isDark? Colors.blue[700]: Colors.blue[100],
          // image: DecorationImage(
          //     image: AssetImage(appTheme.isDark
          //         ? 'assets/images/istockphoto-1085096164-170667a.jpg'
          //         : 'assets/images/istockphoto-684841716-1024x1024.jpg'),
          //     fit: BoxFit.cover)
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.network(
                sessionManager.user.image,
                fit: BoxFit.fill,
                width: 120,
                height: 120,
              ),
            ),
          ),
          RaisedButton.icon(
            label: Text(
              'Home',
              style: TextStyle(color: appTheme.themeData.accentColor),
            ),
            icon: Icon(
              Icons.home,
              size: 30,
              color: appTheme.themeData.accentColor,
            ),
            color: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              commonData.changeStep(2);
            },
          ),
          RaisedButton.icon(
            label: Text(
              'Profile',
              style: TextStyle(color: appTheme.themeData.accentColor),
            ),
            icon: Icon(
              Icons.accessibility,
              size: 30,
              color: appTheme.themeData.accentColor,
            ),
            color: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              commonData.changeStep(6);
            },
          ),
          RaisedButton.icon(
            label: Text(
              'Settings',
              style: TextStyle(color: appTheme.themeData.accentColor),
            ),
            icon: Icon(
              Icons.settings,
              size: 30,
              color: appTheme.themeData.accentColor,
            ),
            color: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),));
              commonData.changeStep(5);
            },
          ),
          RaisedButton.icon(
            label: Text(
              'Stay In Touch',
              style: TextStyle(color: appTheme.themeData.accentColor),
            ),
            icon: Icon(
              Icons.wifi_protected_setup,
              size: 30,
              color: appTheme.themeData.accentColor,
            ),
            color: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              commonData.changeStep(7);
            },
          ),
          RaisedButton.icon(
            color: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              sessionManager.logout();
              Navigator.popAndPushNamed(context, "Login");
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 30,
              color: appTheme.themeData.accentColor,
            ),
            label: Text(
              'Logout',
              style: TextStyle(
                  color: appTheme.themeData.accentColor, fontSize: 18),
            ),
          ),
          RaisedButton.icon(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              onPressed: () {},
              elevation: 0.0,
              icon: Icon(
                Icons.warning,
                size: 25,
                color: Colors.red,
              ),
              label: Text('Report a problem.',
                  style: TextStyle(color: Colors.red, fontSize: 15))),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/8),
              child: Image.asset(
                'assets/images/ogive_version_2.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
