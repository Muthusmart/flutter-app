import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/hompage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>ChangeNotifierProvider(create: (context)=>
    GoogleSignInProvider(),child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MK',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SafeArea(child: HomePage()),
    )
  );
  
}
