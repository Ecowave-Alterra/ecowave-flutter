import 'package:ecowave/core.dart';
import 'package:ecowave/features/ecommerce/model/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:video_player/video_player.dart';

class ReviewListWidget extends StatefulWidget {
  const ReviewListWidget({super.key, required this.review});
  final ProductModel review;

  @override
  State<ReviewListWidget> createState() => _ReviewListWidgetState();
}

class _ReviewListWidgetState extends State<ReviewListWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Review> reviews = List.generate(
        (widget.review.review?.length ?? 0),
        (index) => widget.review.review![index]);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: AppSizes.primary, top: AppSizes.primary),
              child: Row(
                children: [
                  SizedBox(
                    width: 30.0,
                    height: 40.0,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(reviews[index].profilePhoto),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      reviews[index].name,
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: AppFontWeight.medium,
                          color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20.0,
              padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0.0, 4.0),
              child: RatingBar(
                initialRating: reviews[index].rating,
                ignoreGestures: true,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemSize: 14.24,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: const ImageIcon(
                    AppIcons.solidUlasan,
                    color: AppColors.warning500,
                  ),
                  half: const ImageIcon(
                    AppIcons.outlineUlasan,
                    color: AppColors.warning500,
                  ),
                  empty: const ImageIcon(
                    AppIcons.outlineUlasan,
                    color: AppColors.warning500,
                  ),
                ),
                itemPadding: const EdgeInsets.only(right: 4),
                onRatingUpdate: (rating) {},
              ),
            ),
            Row(
              children: [
                Visibility(
                    visible: reviews[index].videoUrl != '',
                    child: VideoReview(
                        video: reviews[index].videoUrl,
                        image: reviews[index].photoUrl)),
                Visibility(
                    visible: reviews[index].photoUrl != '',
                    child: ImageReview(image: reviews[index].photoUrl)),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: AppSizes.primary, right: AppSizes.primary),
              alignment: Alignment.centerLeft,
              child: Text(
                reviews[index].comment,
                style: const TextStyle(
                  fontSize: AppSizes.primary,
                  fontWeight: AppFontWeight.regular,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ImageReview extends StatelessWidget {
  const ImageReview({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const SizedBox(
        height: 0.0,
      );
    } else {
      return Container(
        height: 100.0,
        width: 100.0,
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 16.0),
        child: Image.network(image ??
            'https://storage.googleapis.com/ecowave/img/products/bottle.png'),
      );
    }
  }
}

class VideoReview extends StatefulWidget {
  const VideoReview({super.key, this.video, this.image});
  final String? video;
  final String? image;

  @override
  State<VideoReview> createState() => _VideoReviewState();
}

class _VideoReviewState extends State<VideoReview> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.video ??
        'https://storage.googleapis.com/ecowave/video/reviews/review.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.video == null) {
      return const SizedBox(
        height: 0.0,
      );
    } else {
      return GestureDetector(
        child: Container(
          height: 100.0,
          width: 100.0,
          padding: const EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(widget.image ??
                  'https://storage.googleapis.com/ecowave/img/products/bottle.png'),
              const ImageIcon(AppIcons.ratingVid),
            ],
          ),
        ),
        onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            surfaceTintColor: AppColors.white,
            scrollable: false,
            title: const Text('Video Review'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                VideoPlayerWidget(controller: controller),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Close'),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController? controller;

  const VideoPlayerWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) => controller != null
      ? Container(alignment: Alignment.topCenter, child: buildVideo())
      : const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: VideoPlayer(controller!));
}
