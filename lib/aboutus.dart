import 'package:first_app/home.dart';
import 'package:first_app/settings.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) =>
      DefaultTabController(length: 2, child: Scaffold(appBar: AppBar(title: Text("Tabbar"),
      
      bottom: TabBar(tabs: [Tab(icon:Icon (Icons.settings),text: "settings",),
      
      Tab(icon:Icon (Icons.home_filled),text: "Home",),
      
      
      
      ],
      ),
      
      
      
      
      
      
      ),

body: TabBarView(children: [
settingsPage(),
 Home(),
]


),





      ),
      
      
      );
}
