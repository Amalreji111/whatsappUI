import 'package:flutter/material.dart';
import 'package:listdemo/themes/themeprovider.dart';
import 'package:provider/provider.dart';

class addPeople extends StatefulWidget {
  const addPeople({Key? key}) : super(key: key);

  @override
  State<addPeople> createState() => _addPeopleState();
}

class _addPeopleState extends State<addPeople> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
            title: Text(
              'Add New Contact',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            color: themeNotifier.isDark ? Colors.grey[850] : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Name: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.blueGrey[100],
                              filled: true),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Phone: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.blueGrey[100],
                              filled: true),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text('save')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
