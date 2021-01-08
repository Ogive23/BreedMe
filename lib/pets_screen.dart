import 'package:breed_me/pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class PetsScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
              Container(
                width: MediaQuery.of(context).size.width/5,
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/50,right: MediaQuery.of(context).size.width/50),
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Result 10 - 199'),
                      ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 5,
                          child: RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(AntDesign.filter),
                            label: Text('Filter'),
                            elevation: 0.0,
                            color: Colors.transparent,

                          )),
                    ],
                  ))
            ] +
            List.generate(pets.length, (index) {
              return Container(
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
                                              value: 'update ${pets[index].id}',
                                              child: Text('Update')),
                                          PopupMenuItem(
                                              value: 'delete ${pets[index].id}',
                                              child: Text('Delete'))
                                        ]
                                      : [
                                          new PopupMenuItem(
                                              value: 'report ${pets[index].id}',
                                              child: Text('Report'))
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
                        trailing: Text(
                            DateFormat.yMMMEd().format(pets[index].createdAt)),
                        title: RichText(
                          text: TextSpan(
                              text:
                                  ('${pets[index].name.toUpperCase()}' + '\n'),
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
                              pets[index].status
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
                                        style: TextStyle(color: Colors.green),
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
                                        style: TextStyle(color: Colors.grey),
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
              );
            }),
      ),
    );
  }
}