import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';
import '../../model/entity/cart_model.dart';
import '../../model/service/cart_storage.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, List<CartModel>> {
  final CartService service = CartService();
  CartBloc() : super([]) {
    on<AddItemCart>((event, emit) {
      service.addItem(event.cartModel);
      emit(service.items);
    });
    on<AddTotalItemCart>((event, emit) {
      service.addTotalItem(event.id);
      emit(service.items);
    });
    on<ReduceTotalItemCart>((event, emit) {
      service.reduceTotalItem(event.id);
      emit(service.items);
    });
    on<DeleteItemCart>((event, emit) {
      service.deleteItem(event.id);
      emit(service.items);
    });
    on<DeleteAllItemCart>((event, emit) {
      service.deleteAllItems();
      emit(service.items);
    });
    on<GetItemCart>((event, emit) async {
      emit(service.items);
    });

    on<CheckedItemCart>((event, emit) async {
      final int targetIndex =
          service.items.indexWhere((data) => data.id == event.id);
      if (event.value == false) {
        service.items[targetIndex].checkedItems = false;
      } else if (event.value == true) {
        service.items[targetIndex].checkedItems = true;
      }

      emit(service.items);
    });
  }
}
