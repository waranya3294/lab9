import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab9/screen/display.dart';
import 'package:lab9/screen/formscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDsvh2gVSPukrjLwDs3WITV_HQ7hWbyG_M",
      appId: "1:438109809165:android:b1b081513ab7289cfd4344",
      messagingSenderId: "438109809165",
      projectId: "lab9-245c9",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter'),
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
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2, // The number of tabs.
        child: Scaffold(
          body: TabBarView(
            children: [FromScreen(), Display()],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(text: 'บันทึกอุณหภูมิ'),
              Tab(
                text: 'รายชื่อนักเรียน',
              )
            ],
          ),
          backgroundColor: Color.fromARGB(255, 250, 147, 228),
        ));
  }
}
