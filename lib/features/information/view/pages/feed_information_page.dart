import 'package:ecowave/core.dart';
import 'package:ecowave/features/information/bloc/informatio/information_bloc.dart';
import 'package:ecowave/features/information/view/pages/bookmark_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widget/carousel_information_card_widget.dart';
import '../widget/list_information_widget.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    context.read<InformationBloc>().add(GetInformationEvent());
    super.initState();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Eco',
              style: TextStyle(
                fontSize: 28,
                fontWeight: AppFontWeight.semibold,
                color: AppColors.primary500,
              ),
            ),
            Text(
              'Info',
              style: TextStyle(
                fontSize: 28,
                fontWeight: AppFontWeight.semibold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(const BookmarkPage());
            },
            icon: const ImageIcon(AppIcons.outlineBookmark,
                color: AppColors.primary600, size: 18),
          ),
        ],
      ),
      body: Column(
        children: [
          16.0.height,
          BlocBuilder<InformationBloc, InformationState>(
            builder: (context, state) {
              if (state is InformationLoading) {
                return const EcoLoading();
              } else if (state is InformationSuccess) {
                return CarouselSlider.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index, realIndex) {
                    return CarouselCardInformation(
                      images: state.data[index].photoContentUrl,
                      info: state.data[index].title,
                      informationModel: state.data[index],
                    );
                  },
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 150,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          _current = index;
                        },
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          18.0.height,
          BlocBuilder<InformationBloc, InformationState>(
            builder: (context, state) {
              if (state is InformationLoading) {
                return const SizedBox();
              } else if (state is InformationSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.data.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? AppColors.primary500
                              : const Color(0xffD9D9D9),
                        ),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          30.0.height,
          BlocBuilder<InformationBloc, InformationState>(
            builder: (context, state) {
              if (state is InformationLoading) {
                return const EcoLoading();
              } else if (state is InformationSuccess) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return ListInformation(
                        image: state.data[index].photoContentUrl,
                        date: DateFormat.yMMMMd().format(DateTime.parse(
                          state.data[index].createdAt,
                        )),
                        info: state.data[index].title,
                        informationModel: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 16,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          16.0.height,
        ],
      ),
    );
  }
}
