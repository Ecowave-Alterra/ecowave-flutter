import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/model/models/information_model.dart';
import 'package:ecowave/features/information/view/pages/detail_information_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core.dart';

class ListInformation extends StatelessWidget {
  const ListInformation({
    super.key,
    required this.informationModel,
    required this.isBookmark,
  });
  final InformationModel informationModel;

  final ValueNotifier<bool> isBookmark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(ContentInformation(
          informationModel: informationModel,
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: 357,
        height: 148,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: informationModel.photoContentUrl,
              width: 127,
              height: 148,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const ImageIcon(
                AppIcons.warning,
                color: AppColors.primary500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.parse(
                    informationModel.date,
                  )),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.grey500,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: context.fullWidth - 160.0,
                  child: Text(
                    informationModel.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: AppFontWeight.semibold,
                      color: AppColors.grey700,
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isBookmark,
                  builder: (context, value, _) {
                    return IconButton(
                      onPressed: () {
                        isBookmark.value = !isBookmark.value;
                        if (value == false) {
                          context.read<BookmarkBloc>().add(AddBookmarkEvent(
                              informationModel: informationModel));
                        } else if (value == true) {
                          context.read<BookmarkBloc>().add(DeleteBookmarkEvent(
                              id: informationModel.informationId));
                        }
                      },
                      icon: ImageIcon(
                        value
                            ? AppIcons.solidBookmark
                            : AppIcons.outlineBookmark,
                        color: AppColors.primary600,
                        size: 18,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
