import 'package:coba/alertDialog.dart';
import 'package:coba/dataku.dart';
import 'package:coba/signUp.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  TextEditingController getUsername = TextEditingController();
  TextEditingController getPassword = TextEditingController();
  bool isSecure = true;
  bool isMaxValid = false;
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(-60, -40),
            child: Image(
              image: AssetImage('images/bg.png'),
            ),
          ),
          Center(
            child: Opacity(
              opacity: 0.8,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Text(
                      'My Galaxy',
                      style: TextStyle(fontSize: 20),
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        controller: getUsername,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        controller: getPassword,
                        onChanged: (val) {
                          setState(() {
                            if (val.length < 6 && val.length > 0) {
                              isMaxValid = true;
                            } else {
                              isMaxValid = false;
                            }
                          });
                        },
                        obscureText: isSecure,
                        decoration: InputDecoration(
                          errorText: isMaxValid
                              ? 'Tidak boleh kurang dari 6 karakter'
                              : null,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: isSecure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text('Sign Up')),
                        ElevatedButton(
                            onPressed: () {
                              int count = 0;
                              setState(() {
                                for (var element in data) {
                                  if (getUsername.text == element['username']) {
                                    if (getPassword.text ==
                                        element['password']) {
                                      count = 0;
                                      username = element['username'].toString();
                                      break;
                                    } else {
                                      count++;
                                    }
                                  } else {
                                    count++;
                                  }
                                }
                                if (count > 0) {
                                  alertDialFail(context);
                                } else if (count == 0) {
                                  alertDialSuccess(context, username);
                                }
                              });
                            },
                            child: Text('Log In')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
