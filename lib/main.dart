import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/services/firebase.dart';
import 'app/API/api_client.dart';
import 'app/routes/routes.dart';
import 'app/screens/auth_screen/sign_in_screen.dart';
import 'app/screens/home_page.dart';
import 'app/services/user_store.dart';
import 'app/widgets/authWidget.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<FirebaseFireStore>(FirebaseFireStore());
  Get.put<ApiClient>(ApiClient());
  Get.put<UserStore>(UserStore());

  runApp(const ProviderScope(
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sentimental Analyzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: AuthWidget(
          signedInBuilder: (context) => const HomePage(),
          nonSignedInBuilder: (_) => const SignInPage(),
        ),
      ),
      getPages: RouteHelper.routes
    );
  }
}

