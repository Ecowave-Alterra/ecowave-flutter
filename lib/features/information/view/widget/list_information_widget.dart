import 'package:ecowave/features/information/view/pages/detail_information_page.dart';
import 'package:flutter/material.dart';

import '../../../../core.dart';

class ListInformation extends StatefulWidget {
  const ListInformation({
    super.key,
    required this.image,
    required this.date,
    required this.info,
  });
  final String image, date, info;

  @override
  State<ListInformation> createState() => _ListInformationState();
}

class _ListInformationState extends State<ListInformation> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(const ContentInformation());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              widget.image,
              width: 127,
              height: 148,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.date,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.grey500,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 212,
                  child: Text(
                    widget.info,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: AppFontWeight.semibold,
                      color: AppColors.grey700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      status = !status;
                    });
                  },
                  icon: ImageIcon(
                    status ? AppIcons.solidBookmark : AppIcons.outlineBookmark,
                    color: AppColors.primary600,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
