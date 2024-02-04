import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/globals.dart';
import '../../../views/movie_card.dart';
import '../../home/models/movie_model.dart';

class Downloads extends StatelessWidget {
  final MovieModel movie;
  final double width;
  final double height;
  final int index;
  const Downloads({
    super.key,
    required this.movie,
    required this.index,
    this.width = 150,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: Stack(
        children: [
          MovieCard(
            imageUrl: movie.posterPath != null
                ? Globals.imageAppendUrl + movie.posterPath!
                : Globals.picsumImage,
            height: height.h,
            width: width.w,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: width.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8.r),
                ),
              ),
              child: Text(
                'U/A | 16 |${index + 1} Episode | ${movie.voteCount} MB',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
