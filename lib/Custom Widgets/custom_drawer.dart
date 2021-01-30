import 'package:breed_me/Session/session_manager.dart';
import 'package:breed_me/Shared%20Data/app_language.dart';
import 'package:breed_me/Shared%20Data/app_theme.dart';
import 'package:breed_me/Shared%20Data/common_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  SessionManager sessionManager = new SessionManager();
  CommonData commonData;
  AppTheme appTheme;
  AppLanguage appLanguage;
  @override
  Widget build(BuildContext context) {
    commonData = Provider.of<CommonData>(context);
    appTheme = Provider.of<AppTheme>(context);
    appLanguage = Provider.of<AppLanguage>(context);
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    appTheme.isDark? 'assets/images/istockphoto-1085096164-170667a.jpg' : 'assets/images/istockphoto-684841716-1024x1024.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.network(
                  sessionManager.user.image,
                  fit: BoxFit.fill,
                  width: 120,
                  height: 120,
                ),
              ),
            )),
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
                Navigator.pop(context);
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
                Navigator.pop(context);
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
                Navigator.pop(context);
                commonData.changeStep(7);
              },
            ),
            RaisedButton.icon(
              color: Colors.transparent,
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
                style: TextStyle(color: appTheme.themeData.accentColor, fontSize: 18),
              ),
            ),
            Center(
              child: RaisedButton.icon(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {},
                  icon: Icon(
                    Icons.warning,
                    size: 25,
                    color: Colors.white,
                  ),
                  label: Text('Report a problem.',
                      style: TextStyle(color: Colors.white, fontSize: 15))),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/ogive_version_2.png',width:100,height: 100,fit: BoxFit.contain,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
