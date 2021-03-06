import 'package:breed_me/Shared%20Data/app_language.dart';
import 'package:breed_me/Shared%20Data/app_theme.dart';
import 'package:breed_me/Shared%20Data/common_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Session/session_manager.dart';

class SettingsScreen extends StatelessWidget {
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
      alignment: Alignment.center,
      decoration: BoxDecoration(color: appTheme.themeData.backgroundColor),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.info,
                color: appTheme.themeData.iconTheme.color,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AboutDialog(
                      applicationName: 'FeedMe',
                      applicationVersion: '1.0.0',
                      children: <Widget>[
                        Text('Animations rights reserved to Lottie'),
                        Text('Fonts rights reserved to Google Fonts'),
                        Text('OGIVE ©2020')
                      ],
                    );
                  },
                );
              },
              tooltip: 'License',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: appLanguage.language == 'En'
                  ? <Widget>[
                      Text(appLanguage.words['SettingsDarkMode'],
                          style: appTheme.themeData.textTheme.body1),
                      Switch(
                        value: appTheme.isDark,
                        activeColor: appTheme.themeData.toggleableActiveColor,
                        onChanged: (value) {
                          sessionManager.createPreferredTheme(value);
                          appTheme.changeTheme(value);
                        },
                      ),
                    ]
                  : [
                      Switch(
                        value: appTheme.isDark,
                        activeColor: appTheme.themeData.toggleableActiveColor,
                        onChanged: (value) {
                          sessionManager.createPreferredTheme(value);
                          appTheme.changeTheme(value);
                        },
                      ),
                      Text(appLanguage.words['SettingsDarkMode'],
                          style: appTheme.themeData.textTheme.body1),
                    ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: appLanguage.language == 'En'
                  ? <Widget>[
                      Text(appLanguage.words['SettingsLanguage'],
                          style: appTheme.themeData.textTheme.body1),
                      DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'العربية',
                                style: appTheme.themeData.textTheme.body1,
                              ),
                              value: 'Ar',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'En',
                                style: appTheme.themeData.textTheme.body1,
                              ),
                              value: 'En',
                            )
                          ],
                          value: appLanguage.language,
                          dropdownColor: Colors.amber,
                          icon: Icon(Icons.language),
                          // style: appTheme.themeData.textTheme.body1,
                          onChanged: (value) {
                            sessionManager.createPreferredLanguage(value);
                            appLanguage.changeLanguage(value);
                          }),
                    ]
                  : <Widget>[
                      DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'العربية',
                                style: appTheme.themeData.textTheme.body1,
                              ),
                              value: 'Ar',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'En',
                                style: appTheme.themeData.textTheme.body1,
                              ),
                              value: 'En',
                            )
                          ],
                          value: appLanguage.language,
                          dropdownColor: Colors.amber,
                          icon: Icon(Icons.language),
                          // style: appTheme.themeData.textTheme.body1,
                          onChanged: (value) {
                            sessionManager.createPreferredLanguage(value);
                            appLanguage.changeLanguage(value);
                          }),
                      Text(appLanguage.words['SettingsLanguage'],
                          style: appTheme.themeData.textTheme.body1),
                    ],
            )
          ],
        ),
      ),
    );
  }
}
