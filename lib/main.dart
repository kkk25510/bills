// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:bill_management/Page/Page3.dart';
import 'package:bill_management/models/transaction.dart';
import 'package:bill_management/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize
  await Hive.initFlutter();
  Hive.registerAdapter<Transaction>(TransactionAdapter());
  // box
  var box = await Hive.openBox<Transaction>('transaction');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => TransactionProvider(),
    ),
  ], child: const MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bill Management',
      home: Page1(),
    );
  }
}
