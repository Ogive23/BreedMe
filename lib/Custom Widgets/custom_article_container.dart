import 'package:animations/animations.dart';
import 'package:breed_me/Models/article.dart';
import 'package:breed_me/Session/session_manager.dart';
import 'package:breed_me/Shared%20Data/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomArticleContainer extends StatelessWidget {
  final Article article;
  AppTheme appTheme;
  SessionManager sessionManager = new SessionManager();
  CustomArticleContainer({@required this.article});
  @override
  Widget build(BuildContext context) {
    appTheme = Provider.of<AppTheme>(context);
    return OpenContainer(
      closedBuilder: (context, action) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 50,
              bottom: MediaQuery.of(context).size.height / 50,
              right: MediaQuery.of(context).size.width / 50,
              left: MediaQuery.of(context).size.width / 50,
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 100,
              bottom: MediaQuery.of(context).size.height / 100,
              left: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 50,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                    image: AssetImage(
                      '${article.image}',
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article.id,
                      style: appTheme.getTextStyle(
                          1.0,
                          Colors.white,
                          appTheme.getSemiBodyTextTheme(context),
                          FontWeight.normal,
                          TextDecoration.none),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(article.createdAt),
                      style: appTheme.getTextStyle(
                          1.0,
                          Colors.white,
                          appTheme.getSemiBodyTextTheme(context),
                          FontWeight.normal,
                          TextDecoration.none),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article.title,
                      style: appTheme.getTextStyle(
                          1.0,
                          Colors.white,
                          appTheme.getTextTheme(context),
                          FontWeight.normal,
                          TextDecoration.none),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                      ),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ));
      },
      openBuilder: (context, action) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 100,
                    bottom: MediaQuery.of(context).size.height / 100,
                    left: MediaQuery.of(context).size.width / 25,
                    right: MediaQuery.of(context).size.width / 25,
                  ),
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            '${article.image}',
                          ),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: Image.network(
                                    sessionManager.user.image,
                                    fit: BoxFit.fill,
                                    width: 120,
                                    height: 120,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 100,
                          ),
                          Text.rich(
                            TextSpan(text: 'Shrouk Sobhy\n', children: [
                              TextSpan(
                                  text: 'Founder',
                                  style: appTheme.getTextStyle(
                                      1.0,
                                      Colors.white,
                                      appTheme.getBodyTextTheme(context),
                                      FontWeight.normal,
                                      TextDecoration.none))
                            ]),
                            style: appTheme.getTextStyle(
                                1.0,
                                Colors.white,
                                appTheme.getSemiBodyTextTheme(context),
                                FontWeight.normal,
                                TextDecoration.none),
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/100,),
                      Text(
                        article.title,
                        style: appTheme.getTextStyle(
                            1.0,
                            Colors.white,
                            appTheme.getTextTheme(context),
                            FontWeight.normal,
                            TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 100,
                    bottom: MediaQuery.of(context).size.height / 100,
                    left: MediaQuery.of(context).size.width / 50,
                    right: MediaQuery.of(context).size.width / 50,
                  ),
                  child: Text(
                    article.description,
                    style: appTheme.getTextStyle(
                        1.0,
                        Colors.black,
                        appTheme.getSemiBodyTextTheme(context),
                        FontWeight.normal,
                        TextDecoration.none),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: Icon(EvilIcons.like,size: 30,), onPressed: (){}),

                        IconButton(icon: Icon(EvilIcons.share_google,size: 30,), onPressed: (){}),
                        IconButton(icon: Icon(CupertinoIcons.bookmark,size: 30,), onPressed: (){}),
                      ],
                    ),RaisedButton(
                      onPressed: action,
                      child: Text('Got IT!'),
                      elevation: 0.0,
                      color: Colors.transparent,
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
      transitionType: ContainerTransitionType.fadeThrough,
      closedColor: Colors.transparent, openElevation: 0.0, closedElevation: 0.0,
      // openColor: Colors.blue,
      // transitionDuration: Duration(seconds: 1),
    );
  }
}
