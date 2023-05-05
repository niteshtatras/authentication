import 'dart:html';

import 'package:common_authentication/common_authentication.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Authentication Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  Authentication authentication = Authentication(apiUrl: "apiUrl");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Email
                  TextFormField(
                    controller: textEmailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),
                    ),
                  ),

                  /// Password
                  TextFormField(
                    controller: textPasswordController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                /// button click event
                onTap: (){
                  authentication.authenticateUser(
                      email: textEmailController.text.toString(),
                      password: textPasswordController.text.toString()
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 24, top: 24, bottom: 30, right: 24),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
