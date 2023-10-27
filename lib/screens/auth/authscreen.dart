import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myteethpractice/screens/auth/Authservice.dart';
import 'package:myteethpractice/screens/home/homescreen.dart';
import 'package:myteethpractice/screens/splashscreen_waiting.dart';

final _firebase = FirebaseAuth.instance;

class authscreen extends StatefulWidget {
  const authscreen({super.key});

  @override
  State<authscreen> createState() => _authscreenState();
}

class _authscreenState extends State<authscreen> {
  var _isLogin = true;
  var _isAuthenticatng = false;

  var _enteredUsername = '';
  var _enteredEmail = '';
  var _enteredPassword = '';

  final _form = GlobalKey<FormState>();

  final ButtonStyle style = ElevatedButton.styleFrom(
    backgroundColor: Color.fromRGBO(2, 166, 138, 1.0),

    minimumSize: Size(327, 50),
    //fixedSize: Size(double.infinity, 10),

    textStyle: TextStyle(color: Colors.white),
    elevation: 0,
    shadowColor: Color.fromRGBO(2, 166, 138, 1.0),
  );

  void _submit() async {
    print('Submit button');
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      print('Someproblem');
      return;
    }
    _form.currentState!.save();

    print(_enteredEmail);
    print(_enteredPassword);
    try {
      if (_isLogin) {
        print('Helloo');
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);

        print(userCredential.credential);
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The email address is already in use'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Authentication failed'),
          ),
        );

        setState(() {
          _isAuthenticatng = false;
        });

        print('_isLoggin from auth screen');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(28, 112, 168, 1.0),
              Color.fromRGBO(2, 166, 138, 1.0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        )),
                        margin: const EdgeInsets.fromLTRB(30, 250, 30, 50),
                        child: Form(
                          key: _form,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                if (!_isLogin)
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Username'),
                                    enableSuggestions: false,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.trim().length < 4) {
                                        return 'PLease enter a valid username (at least four characters';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _enteredUsername = value!;
                                    },
                                  ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email Addresss',
                                  ),
                                  autocorrect: false,
                                  textCapitalization: TextCapitalization.none,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.trim().isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter valid email addresss';
                                    }
                                    return null;
                                  },
                                  onSaved: (Value) {
                                    _enteredEmail = Value!;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Paasword',
                                  ),
                                  autocorrect: false,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.trim().isEmpty ||
                                        value.trim().length < 6) {
                                      return 'Please enter a valid Password ';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _enteredPassword = value!;
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                if (_isAuthenticatng)
                                  const CircularProgressIndicator(),
                                if (!_isAuthenticatng)
                                  ElevatedButton(
                                    onPressed: _submit,
                                    style: style,
                                    child: Text(
                                      _isLogin ? 'Login' : 'Signup',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                if (!_isAuthenticatng)
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _isLogin = !_isLogin;
                                      });
                                    },
                                    child: Text(_isLogin
                                        ? 'Create Acoount'
                                        : 'In already have an accout . login.'),
                                  )
                              ],
                            ),
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.fromLTRB(160, 200, 30, 50),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/dental_images_1.jpg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
