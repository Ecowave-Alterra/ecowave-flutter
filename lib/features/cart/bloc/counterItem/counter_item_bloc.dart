import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/service/cart_database.dart';

part 'counter_item_event.dart';
part 'counter_item_state.dart';

class CounterItemBloc extends Bloc<CounterItemEvent, CounterItemState> {
  final DatabaseInstance dbCart;
  CounterItemBloc(this.dbCart) : super(CounterItemInitial()) {
    int? index = 0, id;
    on<IncrementItem>((event, emit) async {
      int totalItems = index + 1;
      dynamic result =
          await dbCart.updateTotalItem(id!, {'totalItems': totalItems});
      emit(CounterItemLoaded(id: id, result: result));
    });
    on<DecrementItem>((event, emit) async {
      int totalItems = index - 1;
      dynamic result =
          await dbCart.updateTotalItem(id!, {'totalItems': totalItems});
      emit(CounterItemLoaded(id: id, result: result));
    });
  }
}
