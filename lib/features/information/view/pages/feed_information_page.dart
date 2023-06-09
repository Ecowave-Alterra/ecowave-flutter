import 'package:ecowave/core.dart';
import 'package:ecowave/features/information/bloc/information/information_bloc.dart';
import 'package:ecowave/features/information/view/pages/bookmark_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/carousel_information_card_widget.dart';
import '../widget/list_information_widget.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final CarouselController _controller = CarouselController();
  final ScrollController scrollController = ScrollController();
  int _current = 0;
  int page = 1;
  @override
  void initState() {
    context.read<InformationBloc>().add(GetInformationEvent(id: page));
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context
            .read<InformationBloc>()
            .add(GetMoreInformationEvent(id: page + 1));
      }
    });
    super.initState();
  }

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
                return const SizedBox();
              } else if (state is InformationSuccess) {
                return CarouselSlider.builder(
                  itemCount: state.data.length > 5 ? 5 : state.data.length,
                  itemBuilder: (context, index, realIndex) {
                    return CarouselCardInformation(
                      informationModel: state.data[index],
                    );
                  },
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 150,
                    initialPage: 0,
                    autoPlay: true,
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
                final informationList = state.data.take(5).toList();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: informationList.asMap().entries.map((entry) {
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
                    controller: scrollController,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return ListInformation(
                        informationModel: state.data[index],
                        isBookmark: ValueNotifier<bool>(false),
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
