import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/shared/design_system/color_palette.dart';
import 'package:movies_app/app/shared/design_system/styles.dart';
import 'package:movies_app/app/shared/utils/constants.dart';
import 'package:movies_app/app/shared/utils/sizes.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyShade900,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderImage(context),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection(kTrTitle.tr(), movie.title),
                      _buildSection(kTrReleaseDate.tr(), "${movie.releaseDate} (CO)"),
                      _buildSection(kTrPopularity.tr(), movie.popularity.toStringAsFixed(2)),
                      _buildSection(kTrVote.tr(), '${(movie.voteAverage * 10).toStringAsFixed(1)}% ⭐'),
                      _buildSection(kTrDescription.tr(), movie.overview),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16.w,
            child: CircleAvatar(
              backgroundColor: black,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: white),
                onPressed: () => context.pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$kTrUrlBaseImage${movie.posterPath}',
          width: kSizeScreenWidth,
          fit: BoxFit.contain,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.broken_image,
            size: 50,
            color: white,
          ),
        ),
        Positioned(
          bottom: 16.h,
          left: 16.w,
          right: 16.w,
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: black54,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              movie.title,
              style: titleDetailStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleSecondaryStyle,
          ),
          SizedBox(height: 8.h),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: greyShade800,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              content,
              style: bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}
