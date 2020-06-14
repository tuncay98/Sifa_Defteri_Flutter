library sifa;

import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'pages/homepage/index.dart';
part 'pages/homepage/state.dart';
part 'pages/allList/index.dart';
part 'pages/allList/state.dart';
part 'pages/blogPage/index.dart';
part 'pages/blogPage/state.dart';

part 'blocs/provider.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-");


  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

    final String name = 'SifaDefterim';
  final FirebaseOptions options = const FirebaseOptions(
    googleAppID: '1:',
    gcmSenderID: '',
    apiKey: '',
  );

  Future<void> _configure() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: name,
      options: options,
    );
    assert(app != null);
    print('Configured $app');
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _configure();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
