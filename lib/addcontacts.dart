import 'package:flutter/material.dart';
import 'package:listdemo/addpoople.dart';
import 'package:listdemo/themes/themeprovider.dart';
import 'package:provider/provider.dart';

class Addcontacts extends StatefulWidget {
  const Addcontacts({Key? key}) : super(key: key);

  @override
  _AddcontactsState createState() => _AddcontactsState();
}

class _AddcontactsState extends State<Addcontacts> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Contact\n0contact',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          backgroundColor: Colors.teal[900],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.person_add_rounded),
          backgroundColor: Colors.teal[900],
        ),
        body: Container(
          color: themeNotifier.isDark ? Colors.grey[850] : Colors.white,
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            themeNotifier.isDark
                                ? Colors.grey[850]
                                : Colors.white,
                          ),
                          side: MaterialStateProperty.all(BorderSide.none),
                        ),
                        label: Text(
                          'Add Contacts',
                          style: TextStyle(
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => addPeople()));
                        },
                        icon: Icon(
                          Icons.group_add,
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                        )),
                  ],
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: 1),
        ),
      );
    });
  }
}
