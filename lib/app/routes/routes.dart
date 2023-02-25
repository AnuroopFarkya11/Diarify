import 'package:get/get.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/notion_editing_page.dart';

import '../screens/auth_screen/sign_in_screen.dart';
import '../screens/getx_helper/binding.dart';
import '../screens/home_page.dart';
import '../screens/notion_editing_page/getx_helper/binding.dart';
import 'route_paths.dart';

class RouteHelper{

  static List<GetPage> routes=[

    GetPage(
      name: RoutePaths.homePage,
      page: ()=> const HomePage(),
      binding: HomePageBinding()
    ),

    GetPage(
      name: RoutePaths.signIn,
      page: ()=> const SignInPage(),
    ),

    GetPage(
      name: RoutePaths.notionEditingPage,
      page: ()=>  const NotionEditingPage(),
      binding: NotionEditingBinding()
    ),
  ];
}