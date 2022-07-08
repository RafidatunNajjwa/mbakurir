// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbakurir/auth.dart';
import 'package:mbakurir/authentication.dart';
import 'package:mbakurir/firebase_options.dart';
import 'package:mbakurir/notif.dart';
import 'package:mbakurir/regist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/screens/home/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

final auth = Authentication();

bool logged = false;

Future<void> main() async { //penginisialisasian agar bisa ke firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotif();
  runApp(MyApp());
}

final GoogleSignIn _googleSignIn = GoogleSignIn();

class MyApp extends StatelessWidget {
  Future<bool> checkLoginValue() async {
    SharedPreferences loginCheck = await SharedPreferences.getInstance();
    return loginCheck.containsKey('username');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MBA KURIR.ID',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: FutureBuilder<bool>(
        future: checkLoginValue(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == false) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
              body: LoginScreen(),
              bottomNavigationBar: BottomAppBar(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "M B A K U R I R . I D",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
            );
          } else {
            return Home();
          }
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      if (kDebugMode) {
        print("Hello world from _gestureRecognizer");
      }
    };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 200,
            ),

            // Login text Widget
            Center(
              child: Container(
                height: 100,
                width: 400,
                alignment: Alignment.center,
                child: Text(
                  "L O G I N",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 1),
            ClipRRect(
              child: Image.asset(
                "assets/images/man.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(
              height: 20,
              width: 10,
            ),

            // Wrong Password text
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Wrong credentials entered", 
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),

            // Textfields for username and password fields
            Container(
              height: 140,
              width: 530,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    controller: usernameController, // Controller for Username
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },

                    controller: passwordController, // Controller for Password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        contentPadding: EdgeInsets.all(20),
                        // Adding the visibility icon to toggle visibility of the password field
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                    obscureText: _isObscure,
                  ),
                ],
              ),
            ),

            // Submit Button
            Container(
              width: 570,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: Colors.pink,
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () { //pas dklik manggil dari kelasn auth yg bagian login/signup
                    AuthenticationService service =
                        AuthenticationService(FirebaseAuth.instance);
                    service
                        .signIn( //sign yg d pnggil
                            email: usernameController.text.trim(),
                            password: passwordController.text.trim())
                        .then((result) { //jika firebasenya nerima brti resultnya true
                      if (result) {
                        Navigator.of(context).push(new MaterialPageRoute( //jka benar pindah ke home
                            builder: (context) => Home()));
                      } else {
                        if (auth.fetchCredentials(
                            usernameController.text, passwordController.text)) { //jika salah bakal di cek di dummy data dan larinya ke 152
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => Home()));
                        } else {
                          setState(() {
                            _isVisible = true;
                          });
                        }
                      }
                    });
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegistScreen()));
                },
                child: Text(
                  "Register here",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ));
  }
}
