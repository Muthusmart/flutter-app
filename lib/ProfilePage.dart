import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 145;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: (EdgeInsets.only(bottom: bottom)),
            child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Muthu Kumar",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Full Stack Developer",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            buildSocialIcon(FontAwesomeIcons.facebook,
           
            ),
            SizedBox(width: 10),
            buildSocialIcon(FontAwesomeIcons.instagram),
            SizedBox(width: 10),
            buildSocialIcon(FontAwesomeIcons.twitter),
            SizedBox(width: 10),
            buildSocialIcon(
              FontAwesomeIcons.linkedin,
            ),
          ]),
          SizedBox(height: 15),
          Divider(),
          SizedBox(height: 16),
          buildAbout(),
        ],
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Center(
            child: Icon(
          icon,
          size: 32,
        )),
      );

  Widget buildAbout() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Mechanical Engineer But Now Full Stack Developer.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          "https://wallpaperbat.com/img/222285-computer-engineering-wallpaper.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
}

Widget buildProfileImage() {
  final double profileHeight = 145;
  return CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey,
    backgroundImage: NetworkImage(
      "https://www.udacity.com/blog/wp-content/uploads/2020/05/softwareengineer.jpeg",
    ),
  );
}
