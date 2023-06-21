import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/model/models/information_model.dart';
import 'package:ecowave/features/information/view/pages/detail_information_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';

class ListBookmark extends StatelessWidget {
  const ListBookmark({
    super.key,
    required this.informationModel,
  });
  final InformationModel informationModel;

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
            Image.network(
              informationModel.photoContentUrl,
              width: 127,
              height: 148,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  IconButton(
                    onPressed: () {
                      context.read<BookmarkBloc>().add(DeleteBookmarkEvent(
                          id: informationModel.informationId));
                    },
                    icon: const ImageIcon(
                      AppIcons.solidBookmark,
                      color: AppColors.primary600,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
