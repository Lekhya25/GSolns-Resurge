import 'package:resurge2/provider/menubar_provider.dart';
import 'package:resurge2/widgets/menubar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Resurge';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00f0faf8)),
            useMaterial3: true,
            fontFamily: 'CustomIcons',
      ),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: const Color(0x00a8f1e4),
          title: Text(MyApp.title),
          centerTitle: true,
        ),
      );
}
