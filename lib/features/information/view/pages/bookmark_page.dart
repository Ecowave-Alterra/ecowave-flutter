import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/view/widget/list_bookmart_widget.dart';
import 'package:ecowave/features/profile/view/empty_session_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.token == '') {
          return const EmptyUserPage();
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Bookmark',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: AppFontWeight.regular,
                  color: AppColors.black,
                ),
              ),
            ),
            body: Column(
              children: [
                24.0.height,
                Expanded(
                  child: BlocBuilder<BookmarkBloc, BookmarkState>(
                    builder: (context, state) {
                      if (state is BookmarkLoading) {
                        return const EcoLoading();
                      } else if (state is BookmarkSuccess) {
                        if (state.data.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 150.0),
                            child: Center(
                              child: EcoEmpty(
                                massage: "Bookmark tidak tersedia",
                                image: AppImages.emptyState,
                                height: context.fullWidth / 2,
                              ),
                            ),
                          );
                        } else {
                          return ListView.separated(
                            itemBuilder: (context, index) => ListBookmark(
                                informationModel: state.data[index]),
                            separatorBuilder: (context, index) => const Divider(
                              height: 16,
                            ),
                            itemCount: state.data.length,
                          );
                        }
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ));
      },
    );
  }
}
