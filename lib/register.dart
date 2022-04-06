import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'loginpage.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  TextEditingController userEmail = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  // ignore: non_constant_identifier_names
  void ShowToast() => Fluttertoast.showToast(
        msg: "Hi Buddy",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      prefixIcon: Icon(
                        Icons.man_sharp,
                        color: Color(0xFFEE4E3A),
                      ),
                      hintText: 'Enter Your Name',
                      labelText: 'Your Name',
                      filled: true,
                      fillColor: Color(0xFFFBEEE2),
                    ),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z]")
                              .hasMatch(value)) {
                        return 'Enter your Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xFFEE4E3A),
                      ),
                      hintText: 'Phone Number',
                      labelText: 'Mobile Number',
                      filled: true,
                      fillColor: Color(0xFFFBEEE2),
                    ),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty ||
                      
                          !RegExp(r"^[0-9+]")
                              .hasMatch(value)) {
                        return 'Enter your Phone No';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: userEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFEE4E3A),
                      ),
                      hintText: 'Email',
                      labelText: 'E-mail ',
                      filled: true,
                      fillColor: Color(0xFFFBEEE2),
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: userEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFEE4E3A),
                      ),
                      hintText: 'Email',
                      labelText: 'Confirm E-mail',
                      filled: true,
                      fillColor: Color(0xFFFBEEE2),
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFEE4E3A),
                      ),
                      hintText: 'Date Of Birth',
                      labelText: 'D.O.B',
                      filled: true,
                      fillColor: Color(0xFFFBEEE2),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _userPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFFEE4E3A),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      filled: true,
                      fillColor: const Color(0xFFFBEEE2),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _userPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFFEE4E3A),
                      ),
                      labelText: ' Confirm Password',
                      hintText: 'Confirm your password',
                      filled: true,
                      fillColor: const Color(0xFFFBEEE2),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
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
                          
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SignInWidget()),
                          );
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
