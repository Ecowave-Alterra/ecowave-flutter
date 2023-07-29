import 'package:cached_network_image/cached_network_image.dart';
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
      physics: const NeverScrollableScrollPhysics(),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: CachedNetworkImage(
                      width: 30.0,
                      height: 30.0,
                      imageUrl: reviews[index].profilePhoto,
                      errorWidget: (context, url, error) => const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ImageIcon(
                          AppIcons.warning,
                          color: AppColors.primary500,
                        ),
                      ),
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
                        image:
                            'https://w7.pngwing.com/pngs/244/695/png-transparent-play-icon-video-player-information-play-icon-miscellaneous-angle-text.png')),
                Hero(
                  tag: 'imageHero_$index',
                  child: GestureDetector(
                    onTap: () => _showFullScreenImage(
                        context, reviews[index].photoUrl, index),
                    child: Visibility(
                      visible: reviews[index].photoUrl.isNotEmpty,
                      child: ImageReview(image: reviews[index].photoUrl),
                    ),
                  ),
                ),
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

  void _showFullScreenImage(BuildContext context, String imageUrl, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(
            imageUrl: imageUrl, heroTag: 'imageHero_$index'),
      ),
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
        child: CachedNetworkImage(
          imageUrl: image ??
              'https://storage.googleapis.com/ecowave/img/products/bottle.png',
          errorWidget: (context, url, error) => const ImageIcon(
            AppIcons.warning,
            color: AppColors.primary500,
            size: 50,
          ),
        ),
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
  bool isVideoPlaying = false; // Add a flag to track video state

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.video ??
        'https://storage.googleapis.com/ecowave/video/reviews/review.mp4')
      ..initialize().then((_) => setState(() {}));
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
              CachedNetworkImage(
                imageUrl: widget.image ??
                    'https://storage.googleapis.com/ecowave/img/products/bottle.png',
                errorWidget: (context, url, error) => const ImageIcon(
                  AppIcons.warning,
                  color: AppColors.primary500,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
        onTap: () => showVideoDialog(),
      );
    }
  }

  void showVideoDialog() {
    isVideoPlaying = true;
    controller!.play();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        surfaceTintColor: AppColors.white,
        scrollable: false,
        title: const Text('Video Review'),
        content: GestureDetector(
            onTap: () {
              if (isVideoPlaying) {
                controller!.pause(); // Pause the video when tapping on it
              } else {
                controller!.play(); // Resume the video when tapping on it again
              }
              setState(() {
                isVideoPlaying =
                    !isVideoPlaying; // Toggle the video playing state
              });
            },
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayerWidget(controller: controller),
                  // Show the button only when video is paused
                  if (isVideoPlaying == false)
                    Positioned.fill(
                      child: IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 80,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          controller!.play();
                          setState(() {
                            isVideoPlaying = true;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ])),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              controller!.pause(); // Pause the video when closing the dialog
              setState(() {
                isVideoPlaying = false; // Reset the video state
              });
              Navigator.pop(context, 'Close');
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
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

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const FullScreenImagePage(
      {super.key, required this.imageUrl, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: Hero(
                  tag: heroTag,
                  child: InteractiveViewer(
                    panEnabled: true,
                    boundaryMargin: const EdgeInsets.all(20.0),
                    minScale: 1.0,
                    maxScale: 5.0,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => const ImageIcon(
                        AppIcons.warning,
                        color: AppColors.primary500,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
