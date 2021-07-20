import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
        theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Dynamic Theme"),
          ),
          body: Center(
            child: Text("Hello WOrld"),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Dark Theme"),
                  trailing: Switch(
                    value: snapshot.data,
                    onChanged: bloc.changeTheme,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc(); // Global instance

// ----------------- MEthod 2----------------

// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       theme: ThemeData.light(),
// //       home: HomePage(),
// //     );
// //   }
// // }

// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool darkThemeEnabled = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
//       home: HomePage(),
//     );
//   }

// // class HomePage extends StatelessWidget {
// //   var darkThemeEnabled;
// //   HomePage(this.darkThemeEnabled);

// //   @override
//   Widget HomePage() {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dynamic Theme"),
//       ),
//       body: Center(
//         child: Text("Hello WOrld"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             ListTile(
//               title: Text("Dark Theme"),
//               trailing: Switch(
//                 value: darkThemeEnabled,
//                 onChanged: (changedTheme) {
//                   setState(() {
//                     darkThemeEnabled = changedTheme;
//                   });
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
