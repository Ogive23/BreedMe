import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../Custom Widgets/custom_card.dart';
import '../../Session/session_manager.dart';
import '../../Shared Data/app_language.dart';
import '../../Shared Data/app_theme.dart';
import '../../Shared Data/common_data.dart';

class StayInTouchScreen extends StatelessWidget {
  SessionManager sessionManager = new SessionManager();
  CommonData commonData;
  AppTheme appTheme;
  AppLanguage appLanguage;
  @override
  Widget build(BuildContext context) {
    commonData = Provider.of<CommonData>(context);
    appTheme = Provider.of<AppTheme>(context);
    appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(
      // backgroundColor: appTheme.themeData.appBarTheme.color,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appTheme.themeData.appBarTheme.color,
        elevation: 0.0,
        title: Text(
          appLanguage.words['StayInTouchTitle'],
          style: appTheme.themeData.textTheme.title,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        height: double.infinity,
        decoration: BoxDecoration(color: appTheme.themeData.backgroundColor),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     height: NativeBannerAdSize.HEIGHT_50.height.toDouble(),
              //     child: FacebookNativeAd(
              //       placementId: "666800453940153_669631920323673",
              //       adType: NativeAdType.NATIVE_BANNER_AD,
              //       bannerAdSize: NativeBannerAdSize.HEIGHT_50,
              //       width: double.infinity,
              //       backgroundColor: appTheme.themeData.backgroundColor,
              //       titleColor: appTheme.themeData.accentColor,
              //       descriptionColor: appTheme.themeData.accentColor,
              //       buttonColor: Colors.deepPurple,
              //       buttonTitleColor: appTheme.themeData.accentColor,
              //       buttonBorderColor: appTheme.themeData.accentColor,
              //       keepAlive: true,
              //       labelColor: Colors.transparent,
              //       listener: (result, value) {
              //         print("Native Ad: $result --> $value");
              //       },
              //     )),
              SizedBox(
                height: 10,
              ),
              CustomCard(
                  cardColor: appTheme.themeData.cardTheme.color,
                  textStyle: appTheme.themeData.textTheme.body2,
                  title: appLanguage.words['StayInTouchFacebookTitle'],
                  subtitle: appLanguage.words['StayInTouchFacebookSubtitle'],
                  url: 'https://www.facebook.com/ogive23/',
                  icon: FontAwesomeIcons.facebook,
                  iconColor: Colors.blue,
                  kind: 'fb',
                  textDirection: appLanguage.textDirection),
              SizedBox(
                height: 20,
              ),
              CustomCard(
                  cardColor: appTheme.themeData.cardTheme.color,
                  textStyle: appTheme.themeData.textTheme.body2,
                  title: appLanguage.words['StayInTouchInstagramTitle'],
                  subtitle: appLanguage.words['StayInTouchInstagramSubtitle'],
                  url: 'https://www.instagram.com/mahmoued.martin/',
                  icon: FontAwesomeIcons.instagram,
                  iconColor: Colors.black,
                  kind: 'insta',
                  textDirection: appLanguage.textDirection),
              SizedBox(
                height: 20,
              ),
              CustomCard(
                  cardColor: appTheme.themeData.cardTheme.color,
                  textStyle: appTheme.themeData.textTheme.body2,
                  title: appLanguage.words['StayInTouchYoutubeTitle'],
                  subtitle: appLanguage.words['StayInTouchYoutubeSubtitle'],
                  url:
                      'https://www.youtube.com/channel/UCedueKqOIz38zog0alc7_eg',
                  icon: FontAwesomeIcons.youtube,
                  iconColor: Colors.red,
                  kind: 'youtube',
                  textDirection: appLanguage.textDirection),

              SizedBox(
                height: 20,
              ),
              CustomCard(
                  cardColor: appTheme.themeData.cardTheme.color,
                  textStyle: appTheme.themeData.textTheme.body2,
                  title: appLanguage.words['StayInTouchTwitterTitle'],
                  subtitle: appLanguage.words['StayInTouchTwitterSubtitle'],
                  url: 'https://twitter.com/MahmouedMartin2',
                  icon: FontAwesomeIcons.twitter,
                  iconColor: Colors.blue,
                  kind: 'twitter',
                  textDirection: appLanguage.textDirection),
            ],
          ),
        ),
      ),
    );
  }
}
