import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myteethpractice/Provider/CarasoulDataNotifier.dart';
import 'package:myteethpractice/Provider/tratmentplanprovider.dart';
import 'package:myteethpractice/dummy/treatmentplanslist.dart';
import 'package:myteethpractice/screens/auth/Authservice.dart';
import 'package:myteethpractice/screens/auth/authscreen.dart';
import 'package:myteethpractice/screens/home/homescreen.dart';
import 'package:myteethpractice/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/splashscreen_waiting.dart';

// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final linearGradient = LinearGradient(
  colors: [Color.fromRGBO(28, 112, 168, 4), Color.fromRGBO(2, 166, 138, 3)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromRGBO(2, 166, 138, 3),
  background: Color.fromARGB(251, 255, 255, 255),
  primary: const Color.fromRGBO(2, 166, 138, 3),
  primaryContainer: const Color.fromRGBO(2, 166, 138, 3),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  primaryColor: const Color.fromRGBO(2, 166, 138, 3),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplashScreen = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider<CarasoulDataNotifier>(
          create: (context) => CarasoulDataNotifier(),
        ),
         ChangeNotifierProvider<tratementprovider>(
          create: (context) => tratementprovider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Consumer<AuthService>(
          builder: (context, authService, child) {
            switch (authService.authState) {
              case AuthServiceState.Intro:
                print("intro");
                return splashscrrenomtro(
                  authService: authService,
                );
              case AuthServiceState.Starting:
                print("starting");
                return const SplashScreenwaiting();
              case AuthServiceState.SignedIn:
                return const homescreen();
              case AuthServiceState.SignedOut:
                return splashscrrenomtro(
                  authService: authService,
                );
              default:
                return authscreen(); // Handle other cases as needed
            }
          },
        ),
      ),
    );
  }
}
