import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../home/models/movie_model.dart';

///TODO : All things are dummy
class DownloadsController extends GetxController {
  ///TODO : I'll remove Home Controller later
  final HomeController dummyData = Get.find<HomeController>();

  final RxList<MovieModel> tvShow = <MovieModel>[].obs;
  final RxList<MovieModel> myList = <MovieModel>[].obs;

  void makeDummyData() async {
    tvShow.clear();
    myList.clear();
    if (dummyData.trandingMovies.length > 5 &&
        dummyData.trandingMovies.length > 10) {
      // TV Show
      tvShow.add(dummyData.trandingMovies[3]);
      tvShow.add(dummyData.trandingMovies[4]);
      tvShow.add(dummyData.trandingMovies[5]);
      // MY List
      myList.add(dummyData.trandingMovies[7]);
      myList.add(dummyData.trandingMovies[8]);
      myList.add(dummyData.trandingMovies[9]);
    }
  }
}
