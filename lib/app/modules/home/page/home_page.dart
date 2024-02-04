import 'package:example/app/modules/home/controllers/home_controller.dart';
import 'package:example/app/views/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/globals.dart';
import '../../../routes/app_pages.dart';
import '../../../views/gap.dart';
import '../../../views/title_text.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  void navigateToMovieDetailPage(int id) {
    Get.toNamed(Routes.movieDetail, parameters: {'movieId': id.toString()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        title: const Text(
          'For Gulshan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, size: 32),
          ),
        ],
      ),
      body: Obx(() {
        return Visibility(
          visible: !controller.isLoading.value,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(title: 'Tranding Now'),
                Gap.kGap,
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    itemCount: controller.trandingMovies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = controller.trandingMovies[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 8.r),
                        child: InkWell(
                          onTap: () => navigateToMovieDetailPage(movie.id!),
                          child: MovieCard(
                            imageUrl: movie.posterPath != null
                                ? Globals.imageAppendUrl + movie.posterPath!
                                : Globals.picsumImage,
                            isBanner: (movie.popularity ?? 0) > 500,
                            isRecent:
                                (movie.releaseDate?.millisecondsSinceEpoch ??
                                        0) >
                                    controller.recent,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Gap.kGapLarge,
                const TitleText(title: 'Feel-good Movies'),
                Gap.kGap,
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    itemCount: controller.trandingMovies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = controller.trandingMovies[
                          controller.trandingMovies.length - 1 - index];
                      return Padding(
                        padding: EdgeInsets.only(right: 8.r),
                        child: InkWell(
                          onTap: () => navigateToMovieDetailPage(movie.id!),
                          child: MovieCard(
                            imageUrl: movie.posterPath != null
                                ? Globals.imageAppendUrl + movie.posterPath!
                                : Globals.picsumImage,
                            // isBanner: (movie.popularity ?? 0) > 500,
                            isRecent:
                                (movie.releaseDate?.millisecondsSinceEpoch ??
                                        0) >
                                    controller.recent,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Gap.kGapLarge,
                const TitleText(title: 'Movies Based on Real Life'),
                Gap.kGap,
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    itemCount: controller.dummyCopy.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = controller.dummyCopy[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 8.r),
                        child: InkWell(
                          onTap: () => navigateToMovieDetailPage(movie.id!),
                          child: MovieCard(
                            imageUrl: movie.posterPath != null
                                ? Globals.imageAppendUrl + movie.posterPath!
                                : Globals.picsumImage,
                            // isBanner: (movie.popularity ?? 0) > 500,
                            isRecent:
                                (movie.releaseDate?.millisecondsSinceEpoch ??
                                        0) >
                                    controller.recent,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
