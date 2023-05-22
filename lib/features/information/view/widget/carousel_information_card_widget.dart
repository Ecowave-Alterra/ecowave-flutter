import 'package:ecowave/core.dart';
import 'package:ecowave/features/information/view/pages/detail_information_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselCardInformation extends StatelessWidget {
  const CarouselCardInformation({
    super.key,
    required this.images,
    required this.info,
  });
  final String images, info;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(const ContentInformation());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 314,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.bottomLeft,
          child: SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.49),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 9.5,
                  top: 4,
                  right: 9.5,
                  bottom: 6,
                ),
                child: Text(
                  info,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: AppFontWeight.semibold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
