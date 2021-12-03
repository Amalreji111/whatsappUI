import 'package:flutter/material.dart';
import 'package:listdemo/Homescreen.dart';
import 'package:listdemo/forgetpassword.dart';
import 'package:listdemo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String uname1 = 'amal';
String pwd1 = 'amal';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _username = TextEditingController();

  final _password = TextEditingController();

  bool pass = true;
  // bool _isdata = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
            title: Text('ACS LOGIN'),
          ),
          body: Container(
            width: double.infinity,
            color: Colors.blueGrey[900],
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _username,
                      validator: (value) {
                        // return _isdata
                        //     ? null
                        //     : 'username and Password Doesnt match';

                        if (value == null || value.isEmpty) {
                          return 'Enter Username';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          suffix: Icon(
                            Icons.people_alt_rounded,
                            size: 15,
                          ),
                          border: InputBorder.none,
                          focusColor: Colors.black,
                          filled: true,
                          fillColor: Colors.blueGrey[400],
                          hintText: 'USER NAME',
                          hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(162, 0, 0, 0))),
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value) {
                        // return _isdata
                        //     ? null
                        //     : 'username and Password Doesnt match';
                        if (value == null || value.isEmpty) {
                          return 'Enter Username';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      cursorHeight: 15,
                      controller: _password,
                      obscureText: pass,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.blueGrey[400],
                          hintText: 'PASSWORD',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(162, 0, 0, 0)),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                pass ? pass = false : pass = true;
                              });
                            },
                            icon: Icon(
                              pass ? Icons.remove_red_eye : Icons.password,
                              size: 15,
                            ),
                          )),
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal[900])),
                          onPressed: () {
                            // print(_formkey.toString());

                            if (_formkey.currentState!.validate()) {
                              checklogin(context);
                            }
                          },
                          child: Text('LOGIN'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void checklogin(BuildContext ctx) async {
    final _uname = _username.text;
    final _pass = _password.text;
    if (_uname == uname1 && _pass == pwd1) {
      final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.setBool(SAVE_KEY_USER, true);

      //go to home
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1) {
        return Homescreen();
      }));
    } else {
      final String _error = 'user name and password doesnt match';
      //snackbar*********************
      // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      //   duration: Duration(seconds: 5),
      //   backgroundColor: Colors.red,
      //   behavior: SnackBarBehavior.floating,
      //   margin: EdgeInsets.all(10),
      //   content: Text(_error),
      // ));************************************
      //alert
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              titleTextStyle: TextStyle(color: Colors.white),
              contentTextStyle: TextStyle(color: Colors.white, fontSize: 22),
              backgroundColor: Colors.black,
              title: Text('Login Failed'),
              content: Text(_error),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).push(
                          MaterialPageRoute(builder: (ctx2) => forgetPass()));
                    },
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            );
          });
      //show text
    }
  }
}
