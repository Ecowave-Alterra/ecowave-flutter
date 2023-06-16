import '../models/product_model.dart';

class ProductService {
  // late Dio _dio;
  // PaymentMethodRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "ProductId": 1,
      "Name": "Botol",
      "Category": "Perabot",
      "Stock": 10,
      "Price": 50000,
      "Status": "Tersedia",
      "Description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed elementum tempus egestas sed. Aliquam malesuada bibendum arcu vitae. Id diam maecenas ultricies mi eget mauris pharetra et ultrices. Congue quisque egestas diam in arcu cursus. Lacus luctus accumsan tortor posuere ac ut consequat. Nulla at volutpat diam ut venenatis tellus in. Consequat nisl vel pretium lectus quam id leo in. Maecenas pharetra convallis posuere morbi. Eget arcu dictum varius duis at. Lorem sed risus ultricies tristique. In nibh mauris cursus mattis molestie a. Vitae congue eu consequat ac felis donec et odio. Maecenas volutpat blandit aliquam etiam erat velit scelerisque in. Enim diam vulputate ut pharetra sit amet aliquam id. At lectus urna duis convallis. Est velit egestas dui id ornare arcu odio ut. Tempor id eu nisl nunc. Tristique senectus et netus et malesuada fames. Netus et malesuada fames ac",
      "ProductImageUrl": [
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png"
      ],
      "AverageRating": 4.5,
      "Rating": [
        {
          "Name": "Nadira",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "PhotoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        },
        {
          "Name": "Adiva",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "PhotoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        }
      ]
    },
    {
      "ProductId": 2,
      "Name": "Botol 2",
      "Category": "Perabot",
      "Stock": 10,
      "Price": 55000,
      "Status": "Tersedia",
      "Description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed elementum tempus egestas sed. Aliquam malesuada bibendum arcu vitae. Id diam maecenas ultricies mi eget mauris pharetra et ultrices. Congue quisque egestas diam in arcu cursus. Lacus luctus accumsan tortor posuere ac ut consequat. Nulla at volutpat diam ut venenatis tellus in. Consequat nisl vel pretium lectus quam id leo in. Maecenas pharetra convallis posuere morbi. Eget arcu dictum varius duis at. Lorem sed risus ultricies tristique. In nibh mauris cursus mattis molestie a. Vitae congue eu consequat ac felis donec et odio. Maecenas volutpat blandit aliquam etiam erat velit scelerisque in. Enim diam vulputate ut pharetra sit amet aliquam id. At lectus urna duis convallis. Est velit egestas dui id ornare arcu odio ut. Tempor id eu nisl nunc. Tristique senectus et netus et malesuada fames. Netus et malesuada fames ac",
      "ProductImageUrl": [
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png"
      ],
      "AverageRating": 4.5,
      "Rating": [
        {
          "Name": "Nadira",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "PhotoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        },
        {
          "Name": "Adiva",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "PhotoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        }
      ]
    },
    {
      "ProductId": 3,
      "Name": "Kantong",
      "Category": "Kantong",
      "Stock": 10,
      "Price": 50000,
      "Status": "Tersedia",
      "Description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed elementum tempus egestas sed. Aliquam malesuada bibendum arcu vitae. Id diam maecenas ultricies mi eget mauris pharetra et ultrices. Congue quisque egestas diam in arcu cursus. Lacus luctus accumsan tortor posuere ac ut consequat. Nulla at volutpat diam ut venenatis tellus in. Consequat nisl vel pretium lectus quam id leo in. Maecenas pharetra convallis posuere morbi. Eget arcu dictum varius duis at. Lorem sed risus ultricies tristique. In nibh mauris cursus mattis molestie a. Vitae congue eu consequat ac felis donec et odio. Maecenas volutpat blandit aliquam etiam erat velit scelerisque in. Enim diam vulputate ut pharetra sit amet aliquam id. At lectus urna duis convallis. Est velit egestas dui id ornare arcu odio ut. Tempor id eu nisl nunc. Tristique senectus et netus et malesuada fames. Netus et malesuada fames ac",
      "ProductImageUrl": [
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png"
      ],
      "AverageRating": 4.5,
      "Rating": [
        {
          "Name": "Nadira",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "PhotoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        },
        {
          "Name": "Adiva",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "PhotoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        }
      ]
    },
    {
      "ProductId": 4,
      "Name": "Kantong 2",
      "Category": "Kantong",
      "Stock": 10,
      "Price": 55000,
      "Status": "Tersedia",
      "Description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed elementum tempus egestas sed. Aliquam malesuada bibendum arcu vitae. Id diam maecenas ultricies mi eget mauris pharetra et ultrices. Congue quisque egestas diam in arcu cursus. Lacus luctus accumsan tortor posuere ac ut consequat. Nulla at volutpat diam ut venenatis tellus in. Consequat nisl vel pretium lectus quam id leo in. Maecenas pharetra convallis posuere morbi. Eget arcu dictum varius duis at. Lorem sed risus ultricies tristique. In nibh mauris cursus mattis molestie a. Vitae congue eu consequat ac felis donec et odio. Maecenas volutpat blandit aliquam etiam erat velit scelerisque in. Enim diam vulputate ut pharetra sit amet aliquam id. At lectus urna duis convallis. Est velit egestas dui id ornare arcu odio ut. Tempor id eu nisl nunc. Tristique senectus et netus et malesuada fames. Netus et malesuada fames ac",
      "ProductImageUrl": [
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png",
        "https://storage.googleapis.com/ecowave/img/products/bottle.png"
      ],
      "AverageRating": 4.5,
      "Rating": [
        {
          "Name": "Nadira",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        },
        {
          "Name": "Adiva",
          "PhotoProfileUrl":
              "https://storage.googleapis.com/ecowave/img/users/profile/profile.png",
          "Rating": 4.5,
          "Comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "CommentAdmin":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          "PhotoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png",
          "VideoUrl":
              "https://storage.googleapis.com/ecowave/img/products/bottle.png"
        }
      ]
    }
  ];

  Future<List<ProductModel>> getProduct() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Rating>> getProductRating() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => Rating.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
