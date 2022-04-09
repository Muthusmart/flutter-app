import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/home.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
                                                                                                                                                                                  
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapchot) {
              if (snapchot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapchot.hasData) {
                return Home();
              } else if (snapchot.hasError) {
                return Center(child: Text("something Went Wrong"));
              } else {
                return SignInWidget();
              }
            }
            ),
      );
}
