import 'package:flutter/material.dart';
import 'package:listdemo/chatscreen.dart';
import 'package:listdemo/login.dart';
import 'package:listdemo/main.dart';
import 'package:provider/provider.dart';
import 'package:listdemo/themes/themeprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes/themepreferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> name = ['amal', 'nikitha', 'alen'];
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
                icon: Icon(themeNotifier.isDark
                    ? Icons.wb_sunny
                    : Icons.nightlight_round)),
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton(
                          autofocus: true,
                          onPressed: () async {
                            final _sharedPref =
                                await SharedPreferences.getInstance();
                            await _sharedPref.clear();

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (ctx) => login()),
                                (route) => false);
                          },
                          child: Text('Signout'),
                        ),
                        value: 1,
                      )
                    ])
          ],
          backgroundColor: Colors.teal[900],
          title: Text(
            'WhatsApp',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('add_contacts');
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            //   return Addcontacts();
            // }));
          }, //go to add contacts
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
          backgroundColor: Colors.teal[900],
        ),
        body: SafeArea(
            child: Container(
                child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(
                'Chat $index',
                style: TextStyle(
                    color: themeNotifier.isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return ChatScreen(name: 'Chat $index');
                }));
              },
              subtitle: Text(
                'Hey! ',
                style: TextStyle(
                    color: themeNotifier.isDark ? Colors.white : Colors.black),
              ),
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage('Assets/images/18920.jpg'),
              ),
              trailing: Text(
                '$index:00pm',
                style: TextStyle(
                    color: themeNotifier.isDark ? Colors.white : Colors.black),
              ),
            );
            // return Text('Amal${index + 1}',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold));
          },
          separatorBuilder: (ctx, index) {
            return Divider(
              height: 15,
              thickness: 0,
              color: themeNotifier.isDark ? Colors.black : Colors.white,
            );
          },
          itemCount: 30,
        )
                //*******Normal listview below**** */
                /**<><><><><><><><><><><><><><><><><><><><><><> */
                /*this list view has a limitation because at the end of the list we dont need a divider,thats not posible with this listview so we use 
     another widget called listview.separated()*/

                //     ListView /* if we use Column() then we can't scroll beyond the screen limit*/ (
                //         children: List.generate(100, (index) {
                //   return Column(
                //     children: [
                //       Text(
                //         'AMAL$index',
                //         style: TextStyle(color: Colors.white, fontSize: 15),
                //       ),
                //       Divider(
                //         height: 15,
                //         thickness: 2,
                //         color: Colors.white,
                //       )
                //     ],
                //   );
                // })),
                )),
      );
    });
  }
}
