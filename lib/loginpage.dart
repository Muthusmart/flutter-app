import 'package:first_app/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:first_app/home.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
final _formKey = GlobalKey<FormState>();
  var isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "MK",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Enter Your Email',
                      labelText: 'Email',
                      filled: true,
                      fillColor: Color(0xFFFBEEE2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  //box styling
                  const SizedBox(
                    height: 30,
                  ),
                  //text input
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: "password",
                      hintText: 'Enter your password',
                      filled: true,
                      fillColor: Color(0xFFFBEEE2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                          onPressed: () {},
                          child: const Text("Forget Password ?")),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          colors: [Colors.redAccent, Colors.green]),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const HomePage() ),);
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "New to Mk ?",
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                              text: "Register Here",
                              style: const TextStyle(
                                  color: Colors.greenAccent, fontSize: 20),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()),
                                  );
                                })
                        ]),
                  ),
                ],
              ),
            )
          ],
        ))),
      ),
    );
  }
}
