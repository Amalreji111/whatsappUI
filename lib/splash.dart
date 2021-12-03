import 'package:flutter/material.dart';
import 'package:listdemo/Homescreen.dart';
import 'package:listdemo/login.dart';
import 'package:listdemo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    checkUserLogin();
    super.initState();
  }

  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[900],
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 270,
            ),
            Image.asset(
              'Assets/images/wtsap.png',
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '   Loading..',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Future<void> checkUserLogin() async {
    final _sharedpreferences = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedpreferences.getBool(SAVE_KEY_USER);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotologin();
    } else {
      goToHome();
    }
  }

  // @override
  // dispose() {
  //   super.dispose();
  // }

  Future<void> gotologin() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => login()));
  }

  Future<void> goToHome() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Homescreen()));
  }
}
