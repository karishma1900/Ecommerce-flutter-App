import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();

  // open a box for storing cart items

  // await Hive.openBox('cartBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context) => CartProvider(),
    child: MaterialApp(
      title: 'E-commerce App',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(primarySwatch: Colors.blue),
      home:MainScreen()
    ),);
      
  
  }
  
  }

