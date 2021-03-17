import 'package:breed_me/Screens/ArticlesScreens/articles_screen.dart';
import 'package:breed_me/Screens/ConsultationScreens/consultations_screen.dart';
import 'package:breed_me/Screens/PetScreens/pets_screen.dart';
import 'package:breed_me/Screens/PlacesScreens/places_screen.dart';
import 'package:breed_me/Screens/RequestScreens/requests_screen.dart';
import 'package:breed_me/Screens/SideScreens/profile_screen.dart';
import 'package:breed_me/Screens/SideScreens/settings_screen.dart';
import 'package:breed_me/Screens/SideScreens/stay_in_touch_screen.dart';

enum Pages {
  PlacesScreen,
  Consultations,
  PetsScreen,
  RequestsScreen,
  ArticlesScreen,
  SettingsScreen,
  ProfileScreen,
  StayInTouchScreen,
}
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