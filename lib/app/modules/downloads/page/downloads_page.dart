import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/globals.dart';
import '../../../views/gap.dart';
import '../../../views/movie_card.dart';
import '../../../views/title_text.dart';
import '../controllers/downloads_controller.dart';
import '../views/download_card.dart';

class DownloadsPage extends GetView<DownloadsController> {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Icon(Icons.person, size: 35),
        titleSpacing: 0,
        title: const Text(
          'Gulshan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, size: 32),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu, size: 32),
          ),
        ],
        elevation: 5,
      ),
      body: Obx(() {
        ///-
        /// TODO : Remove from here
        controller.makeDummyData();

        ///-
        return Visibility(
          visible: !controller.dummyData.isLoading.value,
          replacement: const Center(child: CircularProgressIndicator()),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: const Color.fromARGB(255, 72, 72, 213),
                      child: Icon(
                        Icons.download,
                        size: 25.r,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const TitleText(title: 'Downloads'),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined, size: 20)
                  ],
                ),
                Gap.kGap,
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    itemCount: controller.dummyData.trandingMovies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = controller.dummyData.trandingMovies[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 8.r),
                        child: Downloads(
                          movie: movie,
                          index: index,
                          width: 200,
                          height: 150,
                        ),
                      );
                    },
                  ),
                ),
                Gap.kGapLarge,
                const TitleText(title: 'TV Shows & Movies You have Liked'),
                Gap.kGap,
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    itemCount: controller.tvShow.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = controller.tvShow[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 8.r),
                        child: MovieCard(
                          width: 90,
                          imageUrl: movie.posterPath != null
                              ? Globals.imageAppendUrl + movie.posterPath!
                              : Globals.picsumImage,
                          isShare: true,
                        ),
                      );
                    },
                  ),
                ),
                Gap.kGapLarge,
                const Row(
                  children: [
                    TitleText(title: 'My List'),
                    Spacer(),
                    Text('See All'),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios_outlined, size: 20)
                  ],
                ),
                Gap.kGap,
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    itemCount: controller.myList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = controller.myList[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 8.r),
                        child: MovieCard(
                          width: 90,
                          imageUrl: movie.posterPath != null
                              ? Globals.imageAppendUrl + movie.posterPath!
                              : Globals.picsumImage,
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
