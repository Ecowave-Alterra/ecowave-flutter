import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/features/information/bloc/updatePoint/update_point_bloc.dart';
import 'package:ecowave/features/information/bloc/information/information_bloc.dart';
import 'package:ecowave/features/information/model/services/information_service.dart';
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
        !_scrollController.position.outOfRange) {
      context.read<UpdatePointBloc>().add(GetMessageEvent());
      showPoint(
          onPress: () {
            context.pop();
          },
          context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(AppIcons.outlineBookmark,
                color: AppColors.primary600, size: 18),
          ),
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
