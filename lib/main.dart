import 'package:flutter/material.dart';
import 'package:frentic/Home_page.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'api/apiManager.dart';
import 'api/sharedprefrence.dart';
import 'load.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget _default = new Load();
  bool status = await SharedPrefManager.getBooleanPreferences() != null;

  if (status == true) {
    _default = new Home();
  }

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ApiManager(),
          ),
        ],
        child: Consumer<ApiManager>(
          builder: (ctx, auth, _) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: _default,
          ),
        )),
  );
  /*runApp(
      GetMaterialApp(
        home: Scaffold(
            body: Load()),
  )
  );*/
}
