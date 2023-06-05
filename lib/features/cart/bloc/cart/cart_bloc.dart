import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';
import '../../model/entity/cart_model.dart';
import '../../model/service/cart_database.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final DatabaseInstance dbCart;
  final List<CartModel> data = [
    CartModel(
        nameItems: 'Botol',
        detailItems: 'Perabot',
        price: 50000,
        totalItems: 0,
        image: AppImages.productShop1),
    CartModel(
        nameItems: 'ToteBag',
        detailItems: 'Kantong',
        price: 39000,
        totalItems: 0,
        image: AppImages.productShop2),
    CartModel(
        nameItems: 'ToteBag',
        detailItems: 'Kantong',
        price: 40000,
        totalItems: 0,
        image: AppImages.productShop7),
  ];
  CartBloc(this.dbCart) : super(CartInitial()) {
    on<CartInsert>((event, emit) async {
      await dbCart.database();
      for (CartModel item in data) {
        await dbCart.insert({
          'nameItems': item.nameItems,
          'detailItems': item.detailItems,
          'price': item.price,
          'totalItems': item.totalItems,
          'image': item.image,
        });
      }
      final List<CartModel> result = await dbCart.all();
      emit(CartSuccess(data: result));
    });
  }
}
