import 'package:flutter/material.dart';
import 'package:listdemo/login.dart';
import 'package:listdemo/themes/themeprovider.dart';
import 'package:provider/provider.dart';

class forgetPass extends StatefulWidget {
  const forgetPass({Key? key}) : super(key: key);

  @override
  _forgetPassState createState() => _forgetPassState();
}

class _forgetPassState extends State<forgetPass> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  bool _pass = true;
  bool _pass1 = true;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Text('Set New Password'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (_controller.text == _controller1.text) {
                      pwd1 = _controller.text;
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => login()));
                    } else {
                      print(_controller);
                      print(_controller1);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          content: Text('Password Doesnt Match')));
                    }
                  });
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  obscureText: _pass,
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: 'New Password*',
                      labelStyle: TextStyle(color: Colors.red, fontSize: 15),
                      fillColor: Colors.grey,
                      filled: true,
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _pass ? _pass = false : _pass = true;
                            });
                          },
                          icon: Icon(_pass
                              ? Icons.remove_red_eye
                              : Icons.password_outlined))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _controller1,
                  obscureText: _pass1,
                  decoration: InputDecoration(
                      labelText: 'confirm *',
                      labelStyle: TextStyle(color: Colors.red, fontSize: 15),
                      fillColor: Colors.grey,
                      filled: true,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            _pass1 ? _pass1 = false : _pass1 = true;
                          });
                        },
                        icon: Icon(_pass1
                            ? Icons.remove_red_eye
                            : Icons.password_outlined),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
