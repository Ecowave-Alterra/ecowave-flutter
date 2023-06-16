import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/bloc/isBookmark/is_bookmark_bloc.dart';
import 'package:ecowave/features/information/model/models/information_model.dart';
import 'package:ecowave/features/information/view/pages/detail_information_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core.dart';

class ListInformation extends StatelessWidget {
  const ListInformation({
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
            Image.asset(
              informationModel.photoContentUrl,
              width: 127,
              height: 148,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMMMMd()
                      .format(DateTime.parse(informationModel.createdAt)),
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
                BlocBuilder<IsBookmarkBloc, bool>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        print('state = $state');
                        if (!state) {
                          context.read<BookmarkBloc>().add(AddBookmarkEvent(
                              informationModel: informationModel));
                        } else {
                          context.read<BookmarkBloc>().add(
                              DeleteBookmarkEvent(id: informationModel.id));
                        }
                        context.read<IsBookmarkBloc>().add(informationModel);
                        // final res = await SharedPreferences.getInstance();
                        // res.clear();
                      },
                      icon: ImageIcon(
                        state
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
