// ignore_for_file: non_constant_identifier_names
import 'package:example/initial_page.dart';
import 'package:get/get.dart';
import '../modules/details/bindings/detail_bindings.dart';
import '../modules/details/page/movie_detail_page.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String get INITIAL => Routes.initial;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.initial,
      page: () => const InitialPage(),
    ),
    GetPage(
      name: Routes.movieDetail,
      page: () => const MovieDetailPage(),
      binding: DetailBindings(),
    ),
  ];
}
