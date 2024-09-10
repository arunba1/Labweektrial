import 'package:flutter/material.dart';

import 'colors.dart' as color;

import 'package:http/http.dart' as http;

class Userscreen extends StatefulWidget {
  const Userscreen({super.key});

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  TextEditingController usernamecontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: color.AppColor.gradientFirst,
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        color.AppColor.userscreen1,
        color.AppColor.userscreen2,
        color.AppColor.userscreen3,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              10, MediaQuery.of(context).size.height * 0.15, 20, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/user1.png",
                height: 330,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: usernamecontrol,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white.withOpacity(0.9)),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline,
                      color: Colors.white.withOpacity(0.9)),
                  labelText: 'Enter Your Username',
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordcontrol,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white.withOpacity(0.9)),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline,
                      color: Colors.white.withOpacity(0.9)),
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(onPressed: postdata, child: const Text('Submit')),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(90)),
                child: ElevatedButton.icon(
                  onPressed: () => postdata(),
                  icon: Icon(
                    Icons.emoji_people,
                    size: 32,
                  ),
                  label: Text("Submit",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return Colors.white;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void postdata() {
    print(usernamecontrol.text + ' and ' + passwordcontrol.text);
    Map<String, String> data = {
      'Username': usernamecontrol.text,
      'Password': passwordcontrol.text
    };

    print(data);

    // Replace 'localhost' with your machine's IP address or use '10.0.2.2' if using an Android emulator.
    http
        .post(Uri.parse('http://192.168.1.7:3030/sd'), body: data)
        .then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        // Handle successful response
        print('Data sent successfully!');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User added Successfully!!!'),
          duration: Duration(seconds: 3),
        ));
      } else {
        // Handle error
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }
}

class UsercreationSubmitbutton extends StatelessWidget {
  const UsercreationSubmitbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.emoji_people,
          size: 32,
        ),
        label: Text("Submit",
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }
}
