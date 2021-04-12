import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/custom_navigation.dart';
import 'package:provider/provider.dart';
import 'ProviderModals/bottom_Navigation_Modal.dart';
// import './navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Colors.tealAccent, primaryColor: Colors.blueAccent),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Widget> _pageOptions = <Widget>[
    _pageBuilder(Color(0xff363755), Text("Home")),
    _pageBuilder(Colors.amberAccent, Text("Collection")),
    _pageBuilder(Colors.blueAccent, Text("Favorite")),
    _pageBuilder(Colors.indigoAccent, Text("Profile")),
  ];
  void handletap() {
    print("tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider(
          create: (_) => BottomNavigationModal(),
          child: Container(
            color: Color(0xff363755),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Consumer<BottomNavigationModal>(
                    builder: (context, value, child) {
                  ///
                  ///
                  /// display pages

                  return _pageOptions.elementAt(value.getIndex());

                  ///
                  ///
                }),
                Consumer<BottomNavigationModal>(
                    builder: (context, value, child) {
                  return Align(
                    alignment: Alignment.bottomCenter,

                    ///
                    /// bottom custom navigation
                    ///
                    ///
                    child: CustomNavigation(
                      accentColor: Theme.of(context).accentColor,
                      backgroundColor: Colors.black,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewPage()));
                      },
                      menuItems: [
                        BarItem(
                            index: 0,
                            iconData: Icons.home_outlined,
                            selected: Theme.of(context).primaryColor,
                            currentIndex: value.getIndex(),
                            onTap: value.handleIndexChanged),
                        BarItem(
                            index: 1,
                            iconData: Icons.grid_view,
                            selected: Theme.of(context).primaryColor,
                            currentIndex: value.getIndex(),
                            onTap: value.handleIndexChanged),
                        BarItem(
                            index: 2,
                            iconData: Icons.favorite_border_rounded,
                            selected: Theme.of(context).primaryColor,
                            currentIndex: value.getIndex(),
                            onTap: value.handleIndexChanged),
                        BarItem(
                            index: 3,
                            iconData: Icons.person_outline_rounded,
                            selected: Theme.of(context).primaryColor,
                            currentIndex: value.getIndex(),
                            onTap: value.handleIndexChanged),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 35),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Color(0xff1Bdbb3),
          child: Icon(
            Icons.add,
            size: 25,
          ),
          onPressed: () {
            print('Hello');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget _pageBuilder(Color bgColor, Text child) {
  return Scaffold(
    backgroundColor: bgColor,
    body: Center(child: child),
  );
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Text("New page",
                style: Theme.of(context).textTheme.headline3)));
  }
}
