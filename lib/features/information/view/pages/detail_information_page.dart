import 'package:ecowave/features/information/bloc/informatio/information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

import '../../../../core.dart';

class ContentInformation extends StatelessWidget {
  const ContentInformation({super.key});

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
                children: [
                  16.0.height,
                  Text(
                    state.data[5].title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: AppFontWeight.semibold,
                      color: AppColors.black,
                    ),
                  ),
                  8.0.height,
                  Text(
                    'by ecoInfo  |  ${DateFormat.yMMMMd().format(DateTime.parse(state.data[5].createdAt))}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: AppFontWeight.regular,
                      color: AppColors.grey500,
                    ),
                  ),
                  16.0.height,
                  Image.asset(
                    state.data[5].photoContentUrl,
                  ),
                  16.0.height,
                  Html(
                    data: state.data[5].writingContent,
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
