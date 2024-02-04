import 'package:example/constants/globals.dart';
import 'package:get/get.dart';
import '../../../../services/api_service.dart';
import '../../../../utilities/extensions.dart';
import '../models/movie_model.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService.instance;
  final RxList<MovieModel> trandingMovies = <MovieModel>[].obs;
  final RxBool isLoading = false.obs;
  final int recent = DateTime.now().millisecondsSinceEpoch - Globals.oneMonth;
  final RxList<MovieModel> dummyCopy = <MovieModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    isLoading.value = true;
    final result = await apiService.trendingMovies();
    if (result.success) {
      trandingMovies.value = movieModelFromJson(result);
    } else {
      result.message?.errorSnackbar();
    }

    /// TODO : Remove it
    copy(trandingMovies);
    isLoading.value = false;
  }

  /// Movies base on real life [TEMP]
  void copy(List<MovieModel> list) {
    if (list.length > 5 && list.length > 10) {
      for (int i = 5; i < 10; i++) {
        dummyCopy.add(list[i]);
      }
    }
  }
}
