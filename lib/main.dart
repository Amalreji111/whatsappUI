import 'package:flutter/material.dart';
import 'package:listdemo/Homescreen.dart';
import 'package:listdemo/addcontacts.dart';
import 'package:listdemo/addpoople.dart';
import 'package:listdemo/chatscreen.dart';
import 'package:listdemo/forgetpassword.dart';
import 'package:listdemo/splash.dart';

import 'package:listdemo/themes/themepreferences.dart';
import 'package:listdemo/themes/themeprovider.dart';
import 'package:provider/provider.dart';

const SAVE_KEY_USER = 'USER LOGED IN';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer(
          builder: (context, ThemeModel themeNotifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Whatsapp',
              theme:
                  themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
              home: splash(),
              routes: {
                'add_contacts': (ctx) {
                  return Addcontacts();
                }
              },
            );
          },
        ));
  }
}
