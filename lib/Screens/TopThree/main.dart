import '../SideScreens/settings_screen.dart';
import '../ConsultationScreens/consultation_creation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Session/session_manager.dart';
import '../../Shared Data/app_language.dart';
import '../../Shared Data/app_theme.dart';
import '../../Shared Data/common_data.dart';
import 'HomePage.dart';
import 'first_time_screens.dart';
import '../RegistrationScreens/login_screen.dart';
import '../RegistrationScreens/sign_up_screen.dart';
import '../PetScreens/pet_creation_screen.dart';
import '../PlacesScreens/place_request_screen.dart';
import '../SideScreens/profile_screen.dart';
import 'splash_screen.dart';
import '../SideScreens/stay_in_touch_screen.dart';

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
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "SplashScreen": (BuildContext context) => SplashScreen(),
        "MainScreen": (BuildContext context) => MainScreen(),
        "WelcomeScreen": (BuildContext context) => WelcomeScreen(),
        "LoginScreen": (BuildContext context) => LoginScreen(),
        "SignUp": (BuildContext context) => SignUpScreen(),
        "ConsultationCreation": (BuildContext context) =>
            ConsultationCreationScreen(),
        "PetCreation": (BuildContext context) => PetCreationScreen(),
        "PlaceRequest": (BuildContext context) => PlaceRequestScreen(),
        "Profile": (BuildContext context) => ProfileScreen(),
        "Settings": (BuildContext context) => SettingsScreen(),
        "StayInTouch": (BuildContext context) => StayInTouchScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  final SessionManager sessionManager = new SessionManager();
  static AppTheme appTheme;
  static AppLanguage appLanguage;
  final CommonData commonData = new CommonData();
  @override
  Widget build(BuildContext context) {
    appTheme = new AppTheme(sessionManager.loadPreferredTheme());
    appLanguage = new AppLanguage(sessionManager.loadPreferredLanguage());
    return MultiProvider(providers: [
      ChangeNotifierProvider<AppTheme>(
        create: (context) => appTheme,
      ),
      ChangeNotifierProvider<AppLanguage>(
        create: (context) => appLanguage,
      ),
      ChangeNotifierProvider<CommonData>(
        create: (context) => commonData,
      )
    ], child: BackgroundScreen());
  }
}


