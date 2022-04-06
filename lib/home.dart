// ignore_for_file: constant_identifier_names


import 'package:first_app/loginpage.dart';
import 'package:first_app/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'aboutus.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum Weekend { Saturday, Sunday }

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isCheck1 = false;
  bool isCheck2 = false;
  Weekend day = Weekend.Saturday;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isOn = false;

  final List<bool> _selections = List.generate((3), (index) => false);

  // ignore: non_constant_identifier_names
  void ShowToast() => Fluttertoast.showToast(
        msg: "Hi Buddy",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );

  void showSnackbar() {
    final snackBar = SnackBar(
      content: const Text("Go Back To Your Page ?"),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Do You Want To Leave  ?"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("No")),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Yes")),
            ],
          ));
  bool _chip1 = false;

  var _width = 100.0;
  var _height = 100.0;
  var _border = 0.0;
  var _borderRadius = 0.0;

  // ignore: non_constant_identifier_names
  AnimatedFunction() {
    setState(() {
      _width = _width == 100.0 ? 200.0 : 100.0;
      _height = _height == 100.0 ? 200.0 : 100.0;
    });
  }

  // ignore: non_constant_identifier_names
  ChangeBorder() {
    setState(() {
      _border = _border == 100.0 ? 200.0 : 100.0;
    });
  }

  // ignore: non_constant_identifier_names
  ChangeBorderRadius() {
    setState(() {
      _borderRadius = _borderRadius == 0.0 ? 50.0 : 0.0;
    });
  }

  double rate = 0;
 
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          // ignore: avoid_print
          print("Back Button Pressed!");
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("MK"),
            centerTitle: true,
            toolbarHeight: 30,
            backgroundColor: Colors.greenAccent,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "home",
                  backgroundColor: Colors.greenAccent),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: "Friends",
                backgroundColor: Colors.pinkAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell_circle),
                label: "Notifiation",
                backgroundColor: Colors.lightGreenAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "settings",
                backgroundColor: Colors.amberAccent,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
            unselectedItemColor: Colors.indigoAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // keyboardType: TextInputType.search,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          // borderSide: BorderSide(width: 1),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search your favourite',
                        labelText: 'Search',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Which Device You have"),
                  const SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    title: const Text("Android"),
                    subtitle: const Text("device you have"),
                    secondary: const Icon(Icons.account_balance),
                    value: isCheck1,
                    onChanged: (value) {
                      setState(() {
                        isCheck1 = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text("IOS"),
                    subtitle: const Text("device you have"),
                    secondary: const Icon(Icons.mobile_screen_share),
                    value: isCheck2,
                    onChanged: (value) {
                      setState(() {
                        isCheck2 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Weekend Days"),
                  const SizedBox(
                    height: 10,
                  ),
                  RadioListTile(
                      title: const Text("Saturday"),
                      value: Weekend.Saturday,
                      groupValue: day,
                      onChanged: (Weekend? day) {
                        setState(() {
                          this.day = day!;
                        });
                      }),
                  RadioListTile(
                      title: const Text("Sunday"),
                      value: Weekend.Sunday,
                      groupValue: day,
                      onChanged: (Weekend? day) {
                        setState(() {
                          this.day = day!;
                        });
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Switch(
                    activeColor: Colors.greenAccent,
                    inactiveThumbColor: Colors.blueAccent,
                    inactiveTrackColor: Colors.deepOrangeAccent,
                    value: isOn,
                    onChanged: (bool value) {
                      setState(() {
                        isOn = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  ToggleButtons(
                    children: const [
                      Icon(Icons.local_cafe),
                      Icon(Icons.fastfood),
                      Icon(Icons.cake),
                    ],
                    isSelected: _selections,
                    color: Colors.greenAccent,
                    selectedColor: Colors.indigoAccent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    onPressed: (int index) {
                      setState(() {
                        _selections[index] = !_selections[index];
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Top Cities",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text("No ")),
                      DataColumn(label: Text("City Name")),
                      DataColumn(label: Text("State")),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text("1 ")),
                        DataCell(Text("Tuticorin ")),
                        DataCell(Text("TamilNadu ")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("2 ")),
                        DataCell(Text("Chennai ")),
                        DataCell(Text("TamilNadu ")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("3 ")),
                        DataCell(Text("Coimbatore ")),
                        DataCell(Text("TamilNadu ")),
                      ]),
                    ],
                  ),
                  ElevatedButton(
                    child: const Text("hii"),
                    onPressed: ShowToast,
                  ),
                  Center(
                    child: Container(
                      width: 250,
                      height: 157,
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.greenAccent,
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ListTile(
                              leading: Icon(Icons.album, size: 60),
                              title: Text('Muthu',
                                  style: TextStyle(fontSize: 30.0)),
                              subtitle: Text('hello',
                                  style: TextStyle(fontSize: 18.0)),
                            ),
                            ButtonBar(
                              children: <Widget>[
                                ElevatedButton(
                                  child: const Text('click'),
                                  onPressed: () {},
                                ),
                                ElevatedButton(
                                  child: const Text('me'),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: showSnackbar,
                      child: const Text("Open Snack bar")),
                  ChoiceChip(
                      label: const Text("chip1"),
                      selected: _chip1,
                      avatar: const CircleAvatar(
                        backgroundColor: Colors.redAccent,
                      ),
                      onSelected: (newBoolValue) {
                        setState(() {
                          _chip1 = newBoolValue;
                        });
                      }),
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.lightGreenAccent,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: Colors.purpleAccent,
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: _height,
                          width: _width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            color: Colors.greenAccent,
                            border: Border.all(
                                color: Colors.blueAccent, width: _border),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              AnimatedFunction();
                            },
                            child: const Text(
                              "Click Here",
                              style: TextStyle(color: Colors.white),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              ChangeBorder();
                            },
                            child: const Text("Border")),
                        ElevatedButton(
                            onPressed: () {
                              ChangeBorderRadius();
                            },
                            child: const Text("Border Radius")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Slider(
                      value: rate,
                      onChanged: (newRate) {
                        setState(() {
                          rate = newRate;
                        });
                      },
                      min: 0,
                      max: 100,
                      divisions: 5,
                      label: "$rate",
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 16,
            child: Column(
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  accountName: Text("Muthu"),
                  accountEmail: Text("Muthudevil755@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("MK"),
                  ),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundColor: Colors.lightGreenAccent,
                      child: Text("MK"),
                    )
                  ],
                ),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.add_to_home_screen),
                  onTap: () {
                    _navigateToHome(context);
                  },
                ),
                const Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.favorite),
                  onTap: () {
                    _navigateToaboutus(context);
                  },
                ),
                const Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: const Text("Settings"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    _navigateTosettings(context);
                  },
                ),
                const Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.logout),
                  onTap: () {
                    _navigateTologinpage(context);
                  },
                ),
                const Divider(
                  height: 0.1,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            elevation: 8.0,
            child: const Icon(Icons.add),
            hoverColor: Colors.redAccent,
            splashColor: Colors.deepOrangeAccent,
            backgroundColor: Colors.greenAccent,
            onPressed: () {},
          ),
        ),
      );
}

void _navigateToHome(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const HomePage()));
}

void _navigateToaboutus(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const About()));
}

void _navigateTologinpage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SignInWidget()));
}

void _navigateTosettings(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SettingsPage()));
}
