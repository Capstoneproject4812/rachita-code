import 'package:ipvp/services/auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final Function toggleView;
  Loginpage({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Loginpage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        title: Text('Sign in to IPVP'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                      width: 250,
                      height: 175,
                      /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/signin.jpg')),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
              ),
              // TextFormField(
              //   validator: (val) => val.isEmpty ? 'Enter an email' : null,
              //   onChanged: (val) {
              //     setState(() => email = val);
              //   },
              // ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 5, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
              ),
              // TextFormField(
              //   obscureText: true,
              //   validator: (val) =>
              //       val.length < 6 ? 'Enter a password 6+ chars long' : null,
              //   onChanged: (val) {
              //     setState(() => password = val);
              //   },
              // ),
              SizedBox(height: 5.0),
              // Container(
              //   height: 50,
              //   width: 250,
              //   decoration: BoxDecoration(
              //       color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              //   child: Text(
              //     'Login',
              //     style: TextStyle(color: Colors.white, fontSize: 25),
              //   ),
              // ),
              ElevatedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print('valid');
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      print(email);
                      print(password);
                      if (result == null) {
                        setState(() {
                          error = 'Could not sign in with those credentials';
                        });
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
