import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core.dart';

class ContentInformation extends StatelessWidget {
  const ContentInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const ImageIcon(AppIcons.leftBack,
              color: AppColors.primary500, size: 11),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(AppIcons.outlineBookmark,
                color: AppColors.primary600, size: 18),
          ),
        ],
        backgroundColor: AppColors.white,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grey300,
            height: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 18),
        child: ListView(
          children: [
            16.0.height,
            Text(
              'Menjaga Lingkungan Hidup\ndengan Melakukan Enam\nLangkah Pelestarian',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: AppFontWeight.semibold,
                color: AppColors.black,
              ),
            ),
            8.0.height,
            Text(
              'by ecoInfo  |  5 Mei 2023',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: AppFontWeight.regular,
                color: AppColors.grey500,
              ),
            ),
            16.0.height,
            Image.asset(
              AppImages.cardInfo4,
            ),
            16.0.height,
            Text(
              ' Tahukah anda bahwa setiap tanggal 5 Juni diperingati sebagai Hari Lingkungan Hidup (HLH) Sedunia? Peringatan Hari Lingkungan Sedunia tahun ini merupakan perayaan 50 tahun Konferensi Stockholm. HLH Sedunia tahun ini kembali diperingati dengan tema yang sama seperti 50 tahun yang lalu yaitu “Only One Earth” (Sustainably in Harmony with Nature). Kementerian Lingkungan Hidup dan Kehutanan (KLHK) telah menetapkan tema nasional untuk Indonesia yaitu “Satu Bumi untuk Masa Depan”. Nah, dalam rangka memperingati Hari Lingkungan Hidup Sedunia Direktorat Sekolah Menengah Pertama ingin berbagi informasi mengenai enam langkah melestarikan lingkungan yang bisa dilakukan oleh Sobat SMP sebagai pelajar. Apa sajakah itu?1. Tidak Membuang Sampah Sembarangan\nSampah masih menjadi permasalahan besar yang dihadapi oleh Indonesia. Terlebih masih banyak masyarakat Indonesia yang belum membuang sampah secara tertib di tempatnya. Sobat SMP mungkin pernah melihat masyarakat yang tinggal di bantaran sungai membuang sampah sembarangan ke aliran sungai. Hal ini kemudian mengakibatkan air sungai menjadi tercemar, aliran sungai pun menjadi terhambat dan berpotensi mengakibatkan banjir di wilayah tersebut. Selain itu, lingkungan juga menjadi tidak sehat karena banyak sampah yang mengapung di pinggir sungai.\n2. Tidak Membakar Sampah\nPernahkah Sobat SMP mendapati tetangga sekitar rumah yang membakar sampah? Padahal sebenarnya aktivitas membakar sampah sangat tidak disarankan, loh. Membakar sampah dapat melepaskan gas-gas yang menyebabkan kerusakan ozon. Sedangkan ozon berfungsi mengatur jumlah atau porsi sinar ultraviolet yang masuk ke permukaan Bumi, melindungi Bumi agar sinar ultraviolet tersebut tidak langsung mengenai permukaan Bumi, menyerap sinar ultraviolet, menjaga suhu di Bumi agar tetap stabil, melindungi permukaan Bumi dari benda- benda langit yang jatuh.\n3. Menghemat Energi\nSalah satu langkah yang dapat dilakukan oleh Sobat SMP di kehidupan sehari-hari adalah dengan melakukan penghematan energi. Bagaimana melakukannya? Sobat SMP dapat mematikan lampu di siang hari atau sedang tidak dipakai. Penghematan energi juga bisa dilakukan dengan menghemat BBM dengan meminimalisir penggunaan kendaraan bermotor. Bila hendak pergi ke tempat yang relatif dekat, gunakan sepeda atau berjalan kaki agar emisi dari kendaraan tidak mencemari udara.\n4. Menggunakan Produk Daur Ulang\nBaca Juga Sinergisitas Sudin Pendidikan Wilayah II Jakarta Selatan dalam Menyukseskan PTM Terbatas 100% Menggunakan produk daur ulang dapat menjadi langkah yang membantu mengurangi sampah. Sobat SMP dapat mencoba membuat produk daur ulang dari sampah rumah tangga misalnya memanfaatkan kardus bekas menjadi wadah tempat penyimpanan. Saat ini Sobat SMP dengan cukup mudah bisa membeli produk-produk hasil daur ulang di pasaran.\n5. Menanam Pohon\nSemakin sedikitnya lahan hijau di Indonesia juga menjadi permasalahan yang tidak dapat diabaikan. Sebagai pelajar, Sobat SMP juga harus mengambil tindakan nyata untuk melestarikan lingkungan dengan cara menanam pohon di sekitar rumah. Area pekarangan rumah yang ditanami pohon berfungsi sebagai area resapan air. Bila curah hujan tinggi, area resapan air inilah yang bisa mencegah terjadinya banjir. Jadi, langkah apa saja yang sudah atau akan anda lakukan untuk menjaga kelestarian lingkungan? Jangan lupa juga untuk mengajak keluarga atau teman terdekat agar ikut melestarikan lingkungan, ya. Karena dengan melestarikan lingkungan, artinya kita turut menjaga masa depan bumi.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: AppFontWeight.regular,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
