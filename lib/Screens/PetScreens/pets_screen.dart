import 'file:///C:/Users/mahmo/AndroidStudioProjects/breed_me/lib/Models/pet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class PetsScreen extends StatefulWidget {
  @override
  _PetsScreenState createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  int selectedIndex = 0;
  List<Pet> pets = [
    Pet("1", "1", 'Leo', 1, "Male", "Dog", "", '0', true, DateTime.now()),
    Pet("2", "1", 'Diva', 2, "Female", "Dog", "Hungry", '1', true,
        DateTime.now()),
    Pet("3", "1", 'Rex', 4, "Male", "Dog", "", '2', true, DateTime.now()),
    Pet("4", "2", 'Max', 5, "Male", "Dog", "", '3', false, DateTime.now()),
    Pet("5", "2", 'Mex', 6, "Female", "Dog", "", '4', false, DateTime.now()),
    Pet("6", "2", 'Mox', 4, "Male", "Dog", "", '5', false, DateTime.now()),
    Pet("7", "2", 'Fox', 2, "Female", "Dog", "", '6', true, DateTime.now()),
    Pet("8", "2", 'Zox', 3, "Male", "Dog", "Not Hungry", '7', false,
        DateTime.now()),
    Pet("9", "2", 'Box', 3, "Male", "Dog", "", '8', false, DateTime.now()),
    Pet("10", "2", 'Zmex', 1, "Female", "Dog", "", '9', true, DateTime.now()),
  ];
  List<String> types = [
    null,
    'Dogs',
    'Cats',
    'Birds',
    'Bugs',
    'Spiders',
    'Elephants'
  ];
  List<IconData> typesImage = [
    null,
    FontAwesome5Solid.dog,
    FontAwesome5Solid.cat,
    FontAwesome5Solid.kiwi_bird,
    FontAwesome5Solid.bug,
    FontAwesome5Solid.spider,
    MaterialCommunityIcons.elephant
  ];
  String include = "Both";
  double w, h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 50,
              bottom: MediaQuery.of(context).size.height / 100),
          alignment: Alignment.topRight,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            // width: MediaQuery.of(context).size.width / 4,
                            padding: EdgeInsets.symmetric(
                                horizontal: w / 30, vertical: h / 50),
                            margin: EdgeInsets.symmetric(
                                horizontal: w / 50, vertical: h / 100),
                            decoration: BoxDecoration(
                                color: 0 == selectedIndex
                                    ? Colors.amber
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[200],
                                      blurRadius: 10,
                                      offset: Offset(0, 10))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              FlutterIcons.null__mco,
                              color: 0 == selectedIndex
                                  ? Colors.white
                                  : Colors.grey[700],
                              size: 30,
                            ),
                          ),
                          Text(
                            'No Filter',
                            style: TextStyle(
                                color: 0 == selectedIndex
                                    ? Colors.amber
                                    : Colors.grey[700]),
                          )
                        ],
                      ),
                    ),
                    for (int index = 1; index < types.length; index++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              // width: MediaQuery.of(context).size.width / 4,
                              padding: EdgeInsets.symmetric(
                                  horizontal: w / 30, vertical: h / 50),
                              margin: EdgeInsets.symmetric(
                                  horizontal: w / 50, vertical: h / 100),
                              decoration: BoxDecoration(
                                  color: index == selectedIndex
                                      ? Colors.amber
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[200],
                                        blurRadius: 10,
                                        offset: Offset(0, 10))
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                typesImage[index],
                                color: index == selectedIndex
                                    ? Colors.white
                                    : Colors.grey[700],
                                size: 30,
                              ),
                            ),
                            Text(
                              types[index],
                              style: TextStyle(
                                  color: index == selectedIndex
                                      ? Colors.amber
                                      : Colors.grey[700]),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int index = 0; index < pets.length; index++)
                  Container(
                    child: Card(
                      color: Colors.white,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: PopupMenuButton(
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                    ),
                                    color: Colors.white,
                                    onSelected: (value) async {
                                      List<String> chosen =
                                          value.toString().split(" ");
                                      if (chosen.elementAt(0) == 'update') {
                                        print(
                                            'thing update ${chosen.elementAt(1)}');
                                      } else {
                                        // await memoryApiCaller.delete(
                                        //     oAuthToken:
                                        //     sessionManager.oauthToken,
                                        //     memoryData: {
                                        //       'memoryId': chosen.elementAt(1)
                                        //     });
                                        // setState(() {});
                                        print(
                                            'thing delete ${chosen.elementAt(1)}');
                                      }
                                    },
                                    itemBuilder: (context) {
                                      return (pets[index].ownerId == "1"
                                          //ToDo: Remove Comment
                                          // sessionManager.getUser().id
                                          ? [
                                              PopupMenuItem(
                                                  value:
                                                      'update ${pets[index].id}',
                                                  child: Text('Update')),
                                              PopupMenuItem(
                                                  value:
                                                      'delete ${pets[index].id}',
                                                  child: Text('Delete')),
                                              PopupMenuItem(
                                                  value:
                                                      'share ${pets[index].id}',
                                                  child: Text('Share'))
                                            ]
                                          : [
                                              PopupMenuItem(
                                                  value:
                                                      'report ${pets[index].id}',
                                                  child: Text('Report')),
                                              PopupMenuItem(
                                                  value:
                                                      'share ${pets[index].id}',
                                                  child: Text('Share'))
                                            ]);
                                    },
                                  ))),
                          Image.asset(
                              'assets/images/${pets.elementAt(index).image}.jpg'),
                          //ToDo: Remove Comment
                          // Image.network(
                          //   pets[index].image.replaceAll('\\', ''),
                          //   fit: BoxFit.cover,
                          //   height: MediaQuery.of(context).size.height / 4,
                          //   width: MediaQuery.of(context).size.width / 3,
                          // ),
                          ExpansionTile(
                            trailing: Text(DateFormat.yMMMEd()
                                .format(pets[index].createdAt)),
                            title: RichText(
                              text: TextSpan(
                                  text: ('${pets[index].name.toUpperCase()}' +
                                      '\n'),
                                  style: TextStyle(color: Colors.black),
                                  // style: GoogleFonts.alegreyaSans(
                                  //     fontSize: 24, color: Colors.amber),
                                  children: [
                                    TextSpan(
                                        text: pets[index].status
                                            ? 'Available For Adoption'
                                            : 'Not Available',
                                        style: TextStyle(
                                          color: pets[index].status
                                              ? Colors.green
                                              : Colors.red,
                                        )
                                        // style: GoogleFonts.alegreyaSans(
                                        //     fontSize: 18, color: Colors.teal)
                                        )
                                  ]),
                            ),
                            children: <Widget>[
                              Text(
                                'My Name Is ${pets[index].name}',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'I\'m ${pets[index].age} Years Old',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'I\'m ${pets[index].sex} as you can see',
                                style: TextStyle(color: Colors.black),
                              ),
                              pets[index].notes.isEmpty
                                  ? SizedBox()
                                  : Text(
                                      'Here is some important notes about me I\'m ${pets[index].notes}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black),
                                    ),
                              pets[index].status
                                  ? Text(
                                      'I\'m waiting for your call',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  : Text(
                                      'Thank you for adopting me',
                                      style: TextStyle(color: Colors.black),
                                    ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  pets[index].status &&
                                          pets[index].ownerId != "1"
                                      //ToDo: remove Comment
                                      //sessionManager.user.id
                                      ? RaisedButton.icon(
                                          elevation: 0.0,
                                          color: Colors.white,
                                          icon: Icon(
                                            Feather.send,
                                            color: Colors.green,
                                          ),
                                          onPressed: () {
                                            // likeApiCaller.update(
                                            //       oAuthToken:
                                            //       sessionManager.oauthToken,
                                            //       memoryData: {
                                            //         'memoryId': memories[index].id
                                            //       },
                                            //       userData: {
                                            //         'userId':
                                            //         sessionManager.getUser().id
                                            //       });
                                          },
                                          label: Text(
                                            'Send Adoption Request',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        )
                                      : RaisedButton.icon(
                                          elevation: 0.0,
                                          color: Colors.white,
                                          disabledColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.not_interested,
                                            color: Colors.grey,
                                          ),
                                          onPressed: null,
                                          label: Text(
                                            'N/A',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
