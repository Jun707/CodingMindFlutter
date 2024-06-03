import 'package:flutter/material.dart';
import 'package:myapp/account/welcome.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/services/item_store.dart';
import 'package:myapp/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => ItemStore()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
  ], child: MaterialApp(
      theme: primaryTheme,
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (authProvider.user == null) {
            return const WelcomeScreen();
          } else {
            return const Home();
          }
        },
      ),
    )
    ));
}
