import 'package:example/app/views/gap.dart';
import 'package:example/app/views/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/globals.dart';
import '../../../../utilities/extensions.dart';
import '../../../views/video_player.dart';
import '../controllers/detail_controller.dart';

class MovieDetailPage extends GetView<DetailController> {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap.kXL,
              if (controller.trailers.isNotEmpty)
                Stack(
                  children: [
                    VideoPlayer(
                      height: 180.h,
                      videoUrl: Globals.youTube +
                          (controller.trailers.first.key ??
                              Globals.youTubeDummyKey),
                      imageUrl:
                          controller.moviesDetail.value?.posterPath != null
                              ? Globals.imageAppendUrl +
                                  controller.moviesDetail.value!.posterPath!
                              : Globals.picsumImage,
                    ),
                    Positioned(
                      top: 0,
                      right: 10.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade900,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ),
                    )
                  ],
                ),
              Gap.kGapLarge,
              if (controller.trailers.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Size: ${((controller.trailers.first.size!) / 1024).toStringAsFixed(2)} MB'),
                    RichText(
                      text: TextSpan(
                        text: 'Released ',
                        style: const TextStyle(
                            fontSize: 16,
                            color: C.success500,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: controller
                                .trailers.first.publishedAt.formatDateddMMMyy,
                            style: const TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: C.warning500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              Gap.kGap,
              TitleText(title: controller.moviesDetail.value?.title ?? ''),
              Text(controller.moviesDetail.value?.overview ?? ''),
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'IN PROGRESS!',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: C.warning500),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
