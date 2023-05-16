import 'package:ecowave/routes/routes.dart';

class Nav {
  static final List<RouteConfig> routes = [
    // -----EXAMPLE WITHOUT ARGUMENTS-----
    // RouteConfig(
    //   path: SplashPage.routeName,
    //   builder: (state) => const SplashPage(),
    // ),

    // -----EXAMPLE WITH ARGUMENTS-----
    // RouteConfig(
    //   path: SeeAllHotelPage.routeName,
    //   builder: (state) {
    //     final SeeAllHotelPage args = state.arguments as SeeAllHotelPage;
    //     return SeeAllHotelPage(title: args.title, hotels: args.hotels);
    //   },
    // ),
  ];
}
