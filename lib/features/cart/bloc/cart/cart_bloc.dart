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

      add(GetTotalPayment());
    });
    on<AddTotalItemCart>((event, emit) {
      emit(CartLoading());
      service.addTotalItem(event.id);

      add(GetTotalPayment());
    });
    on<ReduceTotalItemCart>((event, emit) {
      emit(CartLoading());
      service.reduceTotalItem(event.id);

      add(GetTotalPayment());
    });
    on<DeleteItemCart>((event, emit) {
      emit(CartLoading());
      service.deleteItem(event.id);

      add(GetTotalPayment());
    });
    on<DeleteAllItemCart>((event, emit) {
      emit(CartLoading());
      service.deleteAllItems();

      add(GetTotalPayment());
    });
    on<GetItemCart>((event, emit) {
      emit(CartLoading());

      add(GetTotalPayment());
    });

    on<CheckedItemCart>((event, emit) {
      final int targetIndex =
          service.items.indexWhere((data) => data.id == event.id);
      if (event.value == false) {
        service.items[targetIndex].checkedItems = false;
      } else if (event.value == true) {
        service.items[targetIndex].checkedItems = true;
      }
      add(GetTotalPayment());
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
        add(GetTotalPayment());
      },
    );
    on<GetTotalPayment>(
      (event, emit) {
        double totalPayment = 0;
        for (CartModel item
            in service.items.where((element) => element.checkedItems == true)) {
          totalPayment += (item.price * item.totalItems);
        }
        emit(CartSuccess(data: service.items, total: totalPayment));
      },
    );
  }
}
