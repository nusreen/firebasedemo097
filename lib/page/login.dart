import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:firebasedemo/page/register.dart';
import 'package:firebasedemo/page/showproduct.dart';
import 'package:firebasedemo/service/auth_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Authentication & Flutter"),
      ),
      body: ListView(
        children: [
          email(),
          password(),
          login(),
          register(),
          GoogleAuthButton(
            onPressed: () {
              signInWithGoogle();
            },
          )
        ],
      ),
    );
  }

  Container register() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 140),
      child: ElevatedButton(
        onPressed: () {
          var route =
              MaterialPageRoute(builder: (context) => const RegisterPage());
          Navigator.push(context, route);
        },
        child: const Text(
          'Register',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Container login() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 140),
      child: ElevatedButton(
        onPressed: () {
          siginWithEmail(_email.text, _password.text);
          var route = MaterialPageRoute(
            builder: (context) => const ShowProductPage(),
          );
          Navigator.push(context, route);
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Container email() {
    return Container(
      width: 350,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        controller: _email,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            label: Text('E-mail',
                style: TextStyle(fontSize: 20, color: Colors.pink)),
            prefixIcon: Icon(Icons.assignment_ind),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.pink,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                ))),
      ),
    );
  }

  Container password() {
    return Container(
      width: 350,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        controller: _password,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            label: Text('Password',
                style: TextStyle(fontSize: 20, color: Colors.pink)),
            prefixIcon: Icon(Icons.vpn_key),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.pink,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                ))),
      ),
    );
  }
}