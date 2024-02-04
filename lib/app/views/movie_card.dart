import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/globals.dart';
import 'custom_banner.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final bool isBanner;
  final bool isRecent;
  final bool isShare;
  final String bannerText1;
  final String bannerText2;

  const MovieCard({
    this.imageUrl = Globals.picsumImage,
    this.height = 150,
    this.width = 110,
    this.isBanner = false,
    this.isRecent = false,
    this.isShare = false,
    this.bannerText1 = 'TOP',
    this.bannerText2 = '10',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          if (isBanner)
            Positioned(
              right: 0,
              top: 0,
              child: CustomBanner(
                text1: bannerText1,
                text2: bannerText2,
              ),
            ),
          if (isRecent)
            const Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: _Recent(),
            ),
          if (isShare)
            Positioned(
              bottom: 0,
              child: _Share(width: width),
            ),
        ],
      ),
    );
  }
}

class _Share extends StatelessWidget {
  const _Share({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: width.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: -290,
            child: const Icon(
              Icons.send_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            'Share',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class _Recent extends StatelessWidget {
  const _Recent();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.vertical(top: Radius.circular(4.r)),
      ),
      child: const Text(
        '  Recently added',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
