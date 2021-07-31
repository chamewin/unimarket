import 'package:client/services/auth.dart';
import 'package:client/shared/constants.dart';
import 'package:client/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  // const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Create instant object _auth

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text field state
  String fname = '';
  String lname = '';
  String uname = '';
  String phoneNumber = '';
  String error = '';

  Future signUp() async {
    setState(() {
      loading = true;
    });

    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phoneNumber, codeAutoRetrievalTimeout: (String verificationId) {  }, codeSent: (String verificationId, int? forceResendingToken) {  }, verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  }, verificationFailed: (FirebaseAuthException error) {  },  );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            // resizeToAvoidBottomInset: false,
            // White Color
            backgroundColor: Color(0xFFFFFFFF),

            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/logowithtext.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter First Name' : null,
                            onChanged: (value) {
                              setState(() => fname = value);
                            },
                            decoration: textInputDecoration.copyWith(
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Last Name' : null,
                            onChanged: (value) {
                              setState(() => lname = value);
                            },
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Username' : null,
                            onChanged: (value) {
                              setState(() => uname = value);
                            },
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter a Phone Number' : null,
                            onChanged: (value) {
                              setState(() => phoneNumber = value);
                            },
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),

                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 250,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () async {
                                signUp();
                              },
                              child: Text('Register',
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 17)),
                              color: Color(0xFF29BF12),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          SizedBox(
                            width: 250,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () async {
                                widget.toggleView();
                              },
                              child: Text('Sign In',
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 17)),
                              color: Color(0xFF29BF12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
