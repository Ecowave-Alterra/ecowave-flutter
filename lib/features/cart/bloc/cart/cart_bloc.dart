import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/models/cart_model.dart';
import '../../model/service/cart_storage.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService service = CartService();
  CartBloc() : super(CartInitial()) {
    on<AddItemCart>((event, emit) {
      emit(CartLoading());
      service.addItem(event.cartModel);
      emit(CartSuccess(data: service.items, total: service.totalPayment));
    });
    on<AddTotalItemCart>((event, emit) {
      emit(CartLoading());
      service.addTotalItem(event.id);
      emit(CartSuccess(data: service.items, total: service.totalPayment));
    });
    on<ReduceTotalItemCart>((event, emit) {
      emit(CartLoading());
      service.reduceTotalItem(event.id);
      emit(CartSuccess(data: service.items, total: service.totalPayment));
    });
    on<DeleteItemCart>((event, emit) {
      emit(CartLoading());
      service.deleteItem(event.id);
      emit(CartSuccess(data: service.items, total: service.totalPayment));
    });
    on<DeleteAllItemCart>((event, emit) {
      emit(CartLoading());
      service.deleteAllItems();
      emit(CartSuccess(data: service.items, total: service.totalPayment));
    });
    on<GetItemCart>((event, emit) {
      emit(CartLoading());
      emit(CartSuccess(data: service.items, total: service.totalPayment));
    });

    on<CheckedItemCart>((event, emit) {
      final int targetIndex =
          service.items.indexWhere((data) => data.id == event.id);
      if (event.value == false) {
        service.items[targetIndex].checkedItems = false;
      } else if (event.value == true) {
        service.items[targetIndex].checkedItems = true;
      }
      emit(CartSuccess(data: service.items, total: service.totalPayment));
    });
    on<CheckedAllItemCart>(
      (event, emit) {
        if (event.value == false) {
          for (int i = 0; i < service.items.length; i++) {
            service.items[i].checkedItems = false;
          }
        }
        if (event.value == true) {
          for (int i = 0; i < service.items.length; i++) {
            service.items[i].checkedItems = true;
          }
        }
        emit(CartSuccess(data: service.items, total: service.totalPayment));
      },
    );
  }
}
