import 'package:flutter/material.dart';
import 'package:intra/text2text.dart';

@immutable
class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(''),
              ),
              Text("user1"),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.lightBlueAccent,
                  ),
                  title: Text(
                    '+91 9876543210',
                    style: TextStyle(),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email_rounded,
                    color: Colors.lightBlueAccent,
                  ),
                  title: Text(
                    'abc87@gmail.com',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 20.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.lightBlueAccent,
                ),
                title: Center(
                child: const Text('Logout'),
                ),
                iconColor: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const text()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}