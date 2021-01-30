import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  final Color cardColor, iconColor;
  final TextStyle textStyle;
  final String title, subtitle, url, kind;
  final IconData icon;
  final TextDirection textDirection;

  CustomCard(
      {@required this.cardColor,
      @required this.textStyle,
      @required this.title,
      @required this.subtitle,
      @required this.url,
      @required this.icon,
      @required this.iconColor,
      @required this.kind,
      @required this.textDirection});
  Future<void> launchURL(String url, kind) async {
    String protocolURL;
    if (kind == 'fb')
      protocolURL = "fb://page/716275428808273";
    else if (kind == 'twitter')
      protocolURL = "twitter:///user?screen_name=\(MahmouedMartin)";
    try {
      bool launched = await launch(protocolURL,
          forceSafariVC: false, universalLinksOnly: false);
      if (!launched) {
        await launch(url, forceSafariVC: false);
      }
    } catch (e) {
      await launch(url, forceSafariVC: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blueAccent, Colors.pinkAccent])),
      child: GestureDetector(
        onTap: () {
          launchURL(url, kind);
        },
        child: Card(
          color: cardColor,
          elevation: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: FaIcon(
                  icon,
                  color: iconColor,
                  size: 40,
                ),
                title: Text(
                  title,
                  style: textStyle,
                  textDirection: textDirection,
                ),
                subtitle: Text(
                  subtitle,
                  style: textStyle,
                  textDirection: textDirection,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
