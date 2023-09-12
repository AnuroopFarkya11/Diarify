import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/routes/route_paths.dart';
import 'package:snetimentaldiary/app/screens/audio_player.dart';
import 'package:snetimentaldiary/app/screens/getx_helper/controller.dart';
import 'package:snetimentaldiary/app/services/firebase.dart';
import 'app/API/api_client.dart';
import 'app/routes/routes.dart';
import 'app/screens/auth_screen/sign_in_screen.dart';
import 'app/screens/home_page.dart';
import 'app/services/user_store.dart';
import 'app/store/storage.dart';
import 'app/widgets/authWidget.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<FirebaseFireStore>(FirebaseFireStore());
  Get.put<ApiClient>(ApiClient());
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<UserStore>(UserStore());
  Get.put<HomePageController>(HomePageController());
  runApp(const ProviderScope(
      child: MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diarify',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Splashing(),
      getPages: RouteHelper.routes
    );
  }
}

class Splashing extends StatefulWidget {
  const Splashing({Key? key}) : super(key: key);

  @override
  State<Splashing> createState() => _SplashingState();
}

class _SplashingState extends State<Splashing> {

 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                AuthScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/icons/icon.png",height: 300,),
            SizedBox(height: 100,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        signedInBuilder: (context) => const HomePage(),
        nonSignedInBuilder: (_) => const SignInPage(),
      ),
    );
  }
}