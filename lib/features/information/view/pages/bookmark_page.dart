import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/view/widget/list_bookmart_widget.dart';
import 'package:ecowave/features/information/view/widget/list_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bookmark',
            style: GoogleFonts.poppins(
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
                    return ListView.separated(
                      itemBuilder: (context, index) =>
                          ListBookmark(informationModel: state.data[index]),
                      separatorBuilder: (context, index) => const Divider(
                        height: 16,
                      ),
                      itemCount: state.data.length,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ));
  }
}
