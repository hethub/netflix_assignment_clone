import 'package:get/get.dart';
import '../../../../services/api_service.dart';
import '../models/movie_detail_model.dart';
// import '../../../../utilities/extensions.dart';
import '../models/movie_trailer.dart';

class DetailController extends GetxController {
  final ApiService apiService = ApiService.instance;
  final RxBool isLoading = false.obs;
  final Rxn<MoviesDetail> moviesDetail = Rxn();
  final RxList<MoviesTrailer> trailers = <MoviesTrailer>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    final movieId = Get.parameters['movieId']!;

    final result = await Future.wait<dynamic>([
      apiService.getMoviesDetail(movieId),
      apiService.getTrailers(movieId),
    ]);

    /// Movie Detail
    if (result[0].success) {
      moviesDetail.value = moviesDetailFromJson(result[0]);
    } else {
      result[0].message?.errorSnackbar();
    }

    /// Movie Trailers
    if (result[1].success) {
      trailers.value = movieTrailerFromJson(result[1]);
    } else {
      result[1].message?.errorSnackbar();
    }
    isLoading.value = false;
  }
}
