import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white, // Set the color to white
            ),
          ),
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 7, 7, 121)),
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String input_name = '';
  String input_email = '';
  String input_phone = '';
  String input_roll = '';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('NavApp',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('Login...',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  // TextField for user input
                  SizedBox(
                    height: 45,
                    child: TextField(
                      onChanged: (value) {
                        // Update userInput when the text changes
                        setState(() {
                          input_name = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'E-Mail',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      onChanged: (value) {
                        // Update userInput when the text changes
                        setState(() {
                          input_email = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'example@iitk.ac.in',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Phone NUmber',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      onChanged: (value) {
                        // Update userInput when the text changes
                        setState(() {
                          input_phone = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter contact number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Roll Number',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      onChanged: (value) {
                        // Update userInput when the text changes
                        setState(() {
                          input_roll = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter you Roll Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AccountPage(
                              username: input_name,
                              email: input_email,
                              phoneno: input_phone,
                              rollno: input_roll)));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 12, 119, 15),
                    ),
                    child: Text('Show Details'),
                  )),
                  Center(
                    child: Text('or'),
                  ),
                  Center(
                    child: SizedBox(
                      width: 250, // Set your desired width
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        child: Text('Login Using Pingala'),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      );
  }
}

class AccountPage extends StatefulWidget {
  final String username;
  final String email;
  final String phoneno;
  final String rollno;

   AccountPage(
      {required this.username,
      required this.email,
      required this.phoneno,
      required this.rollno});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ALERT',style: TextStyle(fontWeight: FontWeight.bold),),
          content: const Text(
            'Are you sure you want to Logut?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if(didPop){
          return;
        }
        _showBackDialog();
      },
      child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'NavApp',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Icon(Icons.account_circle, size: 200),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Persernal Info',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Name : ${widget.username}',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Roll No : ${widget.rollno}',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Contact Info',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Phone NO : ${widget.phoneno}',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'E-Mail : ${widget.email}',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Travelled',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Kalyanpur       Delhi          Korea',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'Prayagraj        Hawai        Neptune',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}