import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _level = TextEditingController();
  String baseUrl = Api.regis;

  String msg = "";
  static const items = <String>["admin", "user"];

  List<DropdownMenuItem<String>> _myitems = items
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ))
      .toList();

  String valueItem = "admin";

  insertApi() async {
    final res = await http.post(baseUrl, body: {
      'username': _username.text,
      'fullname': _fullname.text,
      'email': _email.text,
      'password': _password.text,
      'level': valueItem
    });

    final dataJson = jsonDecode(res.body);
    _username.clear();
    _password.clear();
    _fullname.clear();
    _email.clear();
    _level.clear();

    if (dataJson['status'] == 1) {
      print(dataJson['msg']);
      showDialog(
          context: context,
          builder: (c) {
            return AlertDialog(
              title: Text("Notifikasi"),
              content: Text(dataJson['msg']),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                )
              ],
            );
          });
      setState(() {
        msg = dataJson['msg'];
      });
    } else if (dataJson['status'] == 2) {
      print(dataJson['msg']);
      Navigator.of(context).pop();
      setState(() {
        msg = "";
      });
    } else {
      print(dataJson['msg']);
      setState(() {
        msg = dataJson['msg'];
      });
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff6bceff), Color(0xff6bceff)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: _fullname,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: _username,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: ListTile(
                          title: Text("Status / Level : "),
                          trailing: DropdownButton(
                            items: _myitems,
                            value: valueItem,
                            onChanged: (e) {
                              setState(() {
                                valueItem = e;
                              });
                            },
                          ))),
                  Spacer(),
                  Material(
                    // onTap: () {
                    //   Navigator.pushNamed(context, '/');
                    // },
                    borderRadius: BorderRadius.circular(20.0),
                    elevation: 10.0,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        insertApi();
                      },
                      // height: 45,
                      // width: MediaQuery.of(context).size.width / 1.2,
                      // decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       colors: [
                      //         Color(0xff6bceff),
                      //         Color(0xFF00abff),
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.all(Radius.circular(50))),
                      //  child: Center(
                      child: Text(
                        'Sign Up'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
            ),
            // Spacer(),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have an account ?"),
                  Text(
                    "Login",
                    style: TextStyle(color: Color(0xff6bceff)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
