import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/bloc/isBookmark/is_bookmark_bloc.dart';
import 'package:ecowave/features/information/bloc/updatePoint/update_point_bloc.dart';
import 'package:ecowave/features/information/bloc/information/information_bloc.dart';
import 'package:ecowave/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

import '../../../../core.dart';
import '../../model/models/information_model.dart';

class ContentInformation extends StatefulWidget {
  const ContentInformation({super.key, required this.informationModel});
  final InformationModel informationModel;

  @override
  State<ContentInformation> createState() => _ContentInformationState();
}

class _ContentInformationState extends State<ContentInformation> {
  final ScrollController _scrollController = ScrollController();
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        // !_scrollController.position.outOfRange &&
        !isScrolled) {
      context.read<UpdatePointBloc>().add(GetMessageEvent());
      context.read<ProfileBloc>().add(GetDataUser());
      showPoint(
        onPress: () => context.pop(),
        context: context,
      );
      isScrolled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<IsBookmarkBloc>().add(widget.informationModel);

    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<IsBookmarkBloc, bool>(builder: (context, state) {
            return IconButton(
              onPressed: () {
                if (state == false) {
                  context.read<BookmarkBloc>().add(AddBookmarkEvent(
                      informationModel: widget.informationModel));
                } else if (state == true) {
                  context.read<BookmarkBloc>().add(DeleteBookmarkEvent(
                      id: widget.informationModel.informationId));
                }
                context.read<IsBookmarkBloc>().add(widget.informationModel);
              },
              icon: ImageIcon(
                state ? AppIcons.solidBookmark : AppIcons.outlineBookmark,
                color: AppColors.primary600,
                size: 18,
              ),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 18),
        child: BlocBuilder<InformationBloc, InformationState>(
          builder: (context, state) {
            if (state is InformationLoading) {
              return const EcoLoading();
            } else if (state is InformationSuccess) {
              return ListView(
                controller: _scrollController,
                children: [
                  16.0.height,
                  Text(
                    widget.informationModel.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: AppFontWeight.semibold,
                      color: AppColors.black,
                    ),
                  ),
                  8.0.height,
                  Text(
                    'by ecoInfo  |  ${DateFormat.yMMMMd().format(DateTime.parse(widget.informationModel.date))}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: AppFontWeight.regular,
                      color: AppColors.grey500,
                    ),
                  ),
                  16.0.height,
                  CachedNetworkImage(
                    imageUrl: widget.informationModel.photoContentUrl,
                    errorWidget: (context, url, error) => const ImageIcon(
                      AppIcons.warning,
                      color: AppColors.primary500,
                      size: 50,
                    ),
                  ),
                  16.0.height,
                  Html(
                    data: widget.informationModel.content,
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
