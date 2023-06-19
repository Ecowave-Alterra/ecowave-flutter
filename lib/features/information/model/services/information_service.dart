import 'package:ecowave/core.dart';
import 'package:dio/dio.dart';
import 'package:ecowave/features/information/model/models/information_model.dart';

class InformationService {
  // List dummy = [
  //   {
  //     "id": 1,
  //     "title": "Lingkungan Rusak Karena Kepentingan Pribadi?",
  //     "status": "Published",
  //     "photo_content_url": AppImages.cardInfo1,
  //     "writing_content":
  //         '<p>Jakarta - Bumi yang kita tinggali beserta lingkungan di dalamnya kian hari makin terancam dengan pertumbuhan populasi manusia yang tiada henti. Namun, tanpa disadari kebiasaan masyarakat sehari-hari juga berkontribusi membuat kondisi bumi makin terancam dampak iklim.Untuk itu, kamu perlu melakukan perubahan agar dapat menjaga bumi demi keberlangsungan generasi masa depan. Tak perlu melakukan aksi besar, beberapa kebiasaan eco-friendly di rumah juga bisa membantu menjaga bumi agar tetap menjadi tempat nyaman untuk ditempati.Ingin tahu apa saja kebiasaan eco-friendly tersebut? Simak 5 hal penting berikut</p><p>&nbsp;</p><ol><li><strong>Kurangi Sampah Makanan</strong></li></ol><p>Mungkin tak banyak dari Anda yang sadar bahwa limbah makanan merupakan salah satu masalah terbesar dalam hal keberlanjutan. Selain membuang-buang uang, makanan yang terbuang juga menjadi tanda terbuangnya sumber daya yang digunakan untuk memproduksi dan mengangkut makanan, baik itu air, tenaga kerja, hingga berbagai energi lainnya.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah</p><p>&nbsp;</p><ol start="2"><li><strong>Hindari Penggunaan Plastik</strong></li></ol><p>Penggunaan plastik sekali pakai sejak lama telah berkontribusi terhadap menumpuknya sampah yang tak dapat terurai. Untuk mengurangi dampaknya, Anda dapat memulai kebiasaan sederhana dari rumah. Mulai dari membawa botol air minum dari rumah saat bepergian daripada membeli air mineral botolan terus menerus, menggunakan kain serbet atau lap sisa saat ingin mengeringkan tangan atau piring dibandingkan memakai tisu dalam jumlah banyak.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah&quot;&nbsp;</p>',
  //     "created_at": "2023-06-03T09:10:00Z",
  //     "updated_at": "2023-06-03T11:25:00Z",
  //     "delete_at": null
  //   },
  //   {
  //     "id": 2,
  //     "title": "Lingkungan Rusak Karena Kepentingan Pribadi?",
  //     "status": "Published",
  //     "photo_content_url": AppImages.cardInfo2,
  //     "writing_content":
  //         '<p>Jakarta - Bumi yang kita tinggali beserta lingkungan di dalamnya kian hari makin terancam dengan pertumbuhan populasi manusia yang tiada henti. Namun, tanpa disadari kebiasaan masyarakat sehari-hari juga berkontribusi membuat kondisi bumi makin terancam dampak iklim.Untuk itu, kamu perlu melakukan perubahan agar dapat menjaga bumi demi keberlangsungan generasi masa depan. Tak perlu melakukan aksi besar, beberapa kebiasaan eco-friendly di rumah juga bisa membantu menjaga bumi agar tetap menjadi tempat nyaman untuk ditempati.Ingin tahu apa saja kebiasaan eco-friendly tersebut? Simak 5 hal penting berikut</p><p>&nbsp;</p><ol><li><strong>Kurangi Sampah Makanan</strong></li></ol><p>Mungkin tak banyak dari Anda yang sadar bahwa limbah makanan merupakan salah satu masalah terbesar dalam hal keberlanjutan. Selain membuang-buang uang, makanan yang terbuang juga menjadi tanda terbuangnya sumber daya yang digunakan untuk memproduksi dan mengangkut makanan, baik itu air, tenaga kerja, hingga berbagai energi lainnya.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah</p><p>&nbsp;</p><ol start="2"><li><strong>Hindari Penggunaan Plastik</strong></li></ol><p>Penggunaan plastik sekali pakai sejak lama telah berkontribusi terhadap menumpuknya sampah yang tak dapat terurai. Untuk mengurangi dampaknya, Anda dapat memulai kebiasaan sederhana dari rumah. Mulai dari membawa botol air minum dari rumah saat bepergian daripada membeli air mineral botolan terus menerus, menggunakan kain serbet atau lap sisa saat ingin mengeringkan tangan atau piring dibandingkan memakai tisu dalam jumlah banyak.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah&quot;&nbsp;</p>',
  //     "created_at": "2023-06-03T09:10:00Z",
  //     "updated_at": "2023-06-03T11:25:00Z",
  //     "delete_at": null
  //   },
  //   {
  //     "id": 3,
  //     "title": "Lingkungan Rusak Karena Kepentingan Pribadi?",
  //     "status": "Published",
  //     "photo_content_url": AppImages.cardInfo3,
  //     "writing_content":
  //         '<p>Jakarta - Bumi yang kita tinggali beserta lingkungan di dalamnya kian hari makin terancam dengan pertumbuhan populasi manusia yang tiada henti. Namun, tanpa disadari kebiasaan masyarakat sehari-hari juga berkontribusi membuat kondisi bumi makin terancam dampak iklim.Untuk itu, kamu perlu melakukan perubahan agar dapat menjaga bumi demi keberlangsungan generasi masa depan. Tak perlu melakukan aksi besar, beberapa kebiasaan eco-friendly di rumah juga bisa membantu menjaga bumi agar tetap menjadi tempat nyaman untuk ditempati.Ingin tahu apa saja kebiasaan eco-friendly tersebut? Simak 5 hal penting berikut</p><p>&nbsp;</p><ol><li><strong>Kurangi Sampah Makanan</strong></li></ol><p>Mungkin tak banyak dari Anda yang sadar bahwa limbah makanan merupakan salah satu masalah terbesar dalam hal keberlanjutan. Selain membuang-buang uang, makanan yang terbuang juga menjadi tanda terbuangnya sumber daya yang digunakan untuk memproduksi dan mengangkut makanan, baik itu air, tenaga kerja, hingga berbagai energi lainnya.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah</p><p>&nbsp;</p><ol start="2"><li><strong>Hindari Penggunaan Plastik</strong></li></ol><p>Penggunaan plastik sekali pakai sejak lama telah berkontribusi terhadap menumpuknya sampah yang tak dapat terurai. Untuk mengurangi dampaknya, Anda dapat memulai kebiasaan sederhana dari rumah. Mulai dari membawa botol air minum dari rumah saat bepergian daripada membeli air mineral botolan terus menerus, menggunakan kain serbet atau lap sisa saat ingin mengeringkan tangan atau piring dibandingkan memakai tisu dalam jumlah banyak.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah&quot;&nbsp;</p>',
  //     "created_at": "2023-06-03T09:10:00Z",
  //     "updated_at": "2023-06-03T11:25:00Z",
  //     "delete_at": null
  //   },
  //   {
  //     "id": 4,
  //     "title": "Lingkungan Rusak Karena Kepentingan Pribadi?",
  //     "status": "Published",
  //     "photo_content_url": AppImages.cardInfo5,
  //     "writing_content":
  //         '<p>Jakarta - Bumi yang kita tinggali beserta lingkungan di dalamnya kian hari makin terancam dengan pertumbuhan populasi manusia yang tiada henti. Namun, tanpa disadari kebiasaan masyarakat sehari-hari juga berkontribusi membuat kondisi bumi makin terancam dampak iklim.Untuk itu, kamu perlu melakukan perubahan agar dapat menjaga bumi demi keberlangsungan generasi masa depan. Tak perlu melakukan aksi besar, beberapa kebiasaan eco-friendly di rumah juga bisa membantu menjaga bumi agar tetap menjadi tempat nyaman untuk ditempati.Ingin tahu apa saja kebiasaan eco-friendly tersebut? Simak 5 hal penting berikut</p><p>&nbsp;</p><ol><li><strong>Kurangi Sampah Makanan</strong></li></ol><p>Mungkin tak banyak dari Anda yang sadar bahwa limbah makanan merupakan salah satu masalah terbesar dalam hal keberlanjutan. Selain membuang-buang uang, makanan yang terbuang juga menjadi tanda terbuangnya sumber daya yang digunakan untuk memproduksi dan mengangkut makanan, baik itu air, tenaga kerja, hingga berbagai energi lainnya.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah</p><p>&nbsp;</p><ol start="2"><li><strong>Hindari Penggunaan Plastik</strong></li></ol><p>Penggunaan plastik sekali pakai sejak lama telah berkontribusi terhadap menumpuknya sampah yang tak dapat terurai. Untuk mengurangi dampaknya, Anda dapat memulai kebiasaan sederhana dari rumah. Mulai dari membawa botol air minum dari rumah saat bepergian daripada membeli air mineral botolan terus menerus, menggunakan kain serbet atau lap sisa saat ingin mengeringkan tangan atau piring dibandingkan memakai tisu dalam jumlah banyak.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah&quot;&nbsp;</p>',
  //     "created_at": "2023-06-03T09:10:00Z",
  //     "updated_at": "2023-06-03T11:25:00Z",
  //     "delete_at": null
  //   },
  //   {
  //     "id": 5,
  //     "title": "Peduli Lingkungan, Yuk Mulai Ganti Botol Plastik dengan Tumblr",
  //     "status": "Published",
  //     "photo_content_url": AppImages.cardInfo6,
  //     "writing_content":
  //         '<p>Jakarta - Bumi yang kita tinggali beserta lingkungan di dalamnya kian hari makin terancam dengan pertumbuhan populasi manusia yang tiada henti. Namun, tanpa disadari kebiasaan masyarakat sehari-hari juga berkontribusi membuat kondisi bumi makin terancam dampak iklim.Untuk itu, kamu perlu melakukan perubahan agar dapat menjaga bumi demi keberlangsungan generasi masa depan. Tak perlu melakukan aksi besar, beberapa kebiasaan eco-friendly di rumah juga bisa membantu menjaga bumi agar tetap menjadi tempat nyaman untuk ditempati.Ingin tahu apa saja kebiasaan eco-friendly tersebut? Simak 5 hal penting berikut</p><p>&nbsp;</p><ol><li><strong>Kurangi Sampah Makanan</strong></li></ol><p>Mungkin tak banyak dari Anda yang sadar bahwa limbah makanan merupakan salah satu masalah terbesar dalam hal keberlanjutan. Selain membuang-buang uang, makanan yang terbuang juga menjadi tanda terbuangnya sumber daya yang digunakan untuk memproduksi dan mengangkut makanan, baik itu air, tenaga kerja, hingga berbagai energi lainnya.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah</p><p>&nbsp;</p><ol start="2"><li><strong>Hindari Penggunaan Plastik</strong></li></ol><p>Penggunaan plastik sekali pakai sejak lama telah berkontribusi terhadap menumpuknya sampah yang tak dapat terurai. Untuk mengurangi dampaknya, Anda dapat memulai kebiasaan sederhana dari rumah. Mulai dari membawa botol air minum dari rumah saat bepergian daripada membeli air mineral botolan terus menerus, menggunakan kain serbet atau lap sisa saat ingin mengeringkan tangan atau piring dibandingkan memakai tisu dalam jumlah banyak.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah&quot;&nbsp;</p>',
  //     "created_at": "2023-06-01T08:00:00Z",
  //     "updated_at": "2023-06-01T10:30:00Z",
  //     "delete_at": null
  //   },
  //   {
  //     "id": 6,
  //     "title":
  //         "Menjaga Lingkungan Hidup dengan Melakukan Enam Langkah Pelestarian",
  //     "status": "Draft",
  //     "photo_content_url": AppImages.cardInfo4,
  //     "writing_content":
  //         '<p>Jakarta - Bumi yang kita tinggali beserta lingkungan di dalamnya kian hari makin terancam dengan pertumbuhan populasi manusia yang tiada henti. Namun, tanpa disadari kebiasaan masyarakat sehari-hari juga berkontribusi membuat kondisi bumi makin terancam dampak iklim.Untuk itu, kamu perlu melakukan perubahan agar dapat menjaga bumi demi keberlangsungan generasi masa depan. Tak perlu melakukan aksi besar, beberapa kebiasaan eco-friendly di rumah juga bisa membantu menjaga bumi agar tetap menjadi tempat nyaman untuk ditempati.Ingin tahu apa saja kebiasaan eco-friendly tersebut? Simak 5 hal penting berikut</p><p>&nbsp;</p><ol><li><strong>Kurangi Sampah Makanan</strong></li></ol><p>Mungkin tak banyak dari Anda yang sadar bahwa limbah makanan merupakan salah satu masalah terbesar dalam hal keberlanjutan. Selain membuang-buang uang, makanan yang terbuang juga menjadi tanda terbuangnya sumber daya yang digunakan untuk memproduksi dan mengangkut makanan, baik itu air, tenaga kerja, hingga berbagai energi lainnya.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah</p><p>&nbsp;</p><ol start="2"><li><strong>Hindari Penggunaan Plastik</strong></li></ol><p>Penggunaan plastik sekali pakai sejak lama telah berkontribusi terhadap menumpuknya sampah yang tak dapat terurai. Untuk mengurangi dampaknya, Anda dapat memulai kebiasaan sederhana dari rumah. Mulai dari membawa botol air minum dari rumah saat bepergian daripada membeli air mineral botolan terus menerus, menggunakan kain serbet atau lap sisa saat ingin mengeringkan tangan atau piring dibandingkan memakai tisu dalam jumlah banyak.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah&quot;&nbsp;</p>',
  //     "created_at": "2023-06-02T14:20:00Z",
  //     "updated_at": "2023-06-02T16:45:00Z",
  //     "delete_at": null
  //   },
  //   {
  //     "id": 7,
  //     "title": "Tetap Trendi dengan Produk Berkelanjutan yang Ramah Lingkungan",
  //     "status": "Published",
  //     "photo_content_url": AppImages.cardInfo7,
  //     "writing_content":
  //         '<p>Jakarta - Bumi yang kita tinggali beserta lingkungan di dalamnya kian hari makin terancam dengan pertumbuhan populasi manusia yang tiada henti. Namun, tanpa disadari kebiasaan masyarakat sehari-hari juga berkontribusi membuat kondisi bumi makin terancam dampak iklim.Untuk itu, kamu perlu melakukan perubahan agar dapat menjaga bumi demi keberlangsungan generasi masa depan. Tak perlu melakukan aksi besar, beberapa kebiasaan eco-friendly di rumah juga bisa membantu menjaga bumi agar tetap menjadi tempat nyaman untuk ditempati.Ingin tahu apa saja kebiasaan eco-friendly tersebut? Simak 5 hal penting berikut</p><p>&nbsp;</p><ol><li><strong>Kurangi Sampah Makanan</strong></li></ol><p>Mungkin tak banyak dari Anda yang sadar bahwa limbah makanan merupakan salah satu masalah terbesar dalam hal keberlanjutan. Selain membuang-buang uang, makanan yang terbuang juga menjadi tanda terbuangnya sumber daya yang digunakan untuk memproduksi dan mengangkut makanan, baik itu air, tenaga kerja, hingga berbagai energi lainnya.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah</p><p>&nbsp;</p><ol start="2"><li><strong>Hindari Penggunaan Plastik</strong></li></ol><p>Penggunaan plastik sekali pakai sejak lama telah berkontribusi terhadap menumpuknya sampah yang tak dapat terurai. Untuk mengurangi dampaknya, Anda dapat memulai kebiasaan sederhana dari rumah. Mulai dari membawa botol air minum dari rumah saat bepergian daripada membeli air mineral botolan terus menerus, menggunakan kain serbet atau lap sisa saat ingin mengeringkan tangan atau piring dibandingkan memakai tisu dalam jumlah banyak.Baca artikel wolipop, &quot;5 Kebiasaan Eco-Friendly buat Jaga Bumi, Mudah Diterapkan di Rumah&quot;&nbsp;</p>',
  //     "created_at": "2023-06-03T09:10:00Z",
  //     "updated_at": "2023-06-03T11:25:00Z",
  //     "delete_at": null
  //   },
  // ];
  late Dio _dio;
  InformationService() {
    _dio = Dio();
  }
  Future<List<InformationModel>> getInformation() async {
    try {
      const String url = '${BaseURL.mock}user/information';
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List data = response.data['Informations'];
        return data.map((e) => InformationModel.fromJson(e)).toList();
      } else {
        throw 'get informations failed';
      }
    } catch (e) {
      rethrow;
    }
  }
}
