import 'package:example/app/modules/downloads/controllers/downloads_controller.dart';
import 'package:example/app/modules/home/controllers/home_controller.dart';
import 'package:example/app/modules/new_and_hot/controllers/new_and_hot_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Example",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppTheme.data,
          // theme: ThemeData.dark(),
          initialBinding: BindingsBuilder(() {
            Get.lazyPut<HomeController>(() => HomeController());
            Get.lazyPut<NewAndHotController>(() => NewAndHotController());
            Get.lazyPut<DownloadsController>(() => DownloadsController());
          }),
        );
      },
    );
  }
}
